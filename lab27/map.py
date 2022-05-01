import numpy as np
import matplotlib.pyplot as mp
import psycopg2

for i in range(0, 134):
	p = np.load(f"coastline/coastline-{i}.npz");

	mp.plot(p['x'], p['y'], c='#0077ff', linewidth=1.0)
con = psycopg2.connect("dbname=g394-Podyapolskiy user=postgres host=127.0.0.1 port=5432")

cur = con.cursor()
car = con.cursor()
sir = con.cursor()
cur.execute("SELECT lon, lat FROM noaa_sample.station WHERE type = 'dart' AND data='y';")
car.execute("SELECT lon, lat FROM noaa_sample.station WHERE type = 'dart';")
sir.execute("SELECT lon, lat FROM noaa_sample.station;")

lst = cur.fetchall()
lsm = car.fetchall()
lsb = sir.fetchall()
cur.close()
car.close()
sir.close()

con.close()

x, y = np.array(lsb).T
mp.scatter(x, y, s=5, c='#a0a0a0')

x, y = np.array(lsm).T
mp.scatter(x, y, s=5, c='#2a2a2a')

x, y = np.array(lst).T
mp.scatter(x, y, s=5, c='#ff0077')

mp.title('coastline')
mp.xlabel('lon')
mp.ylabel('lat')

mp.grid(True, which='both')

mp.show()
mp.savefig('map.png',format='png')
