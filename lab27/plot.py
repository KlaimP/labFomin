import psycopg2 as p
import numpy as n
import matplotlib.pyplot as m

con=p.connect("dbname=g394-Podyapolskiy user=postgres host=127.0.0.1 port=5432")

cur=con.cursor()
cur.execute("SELECT datetime, height FROM noaa_sample.data WHERE station = '21415';")

arr=cur.fetchall()
cur.close()
con.close()

x ,y = n.array(arr).T

m.plot(x, y, c='#557700', linewidth=1.0)

m.title('station 21415')
m.xlabel('time')
m.ylabel('height')

m.grid(True,which='both')

m.savefig('21315.png')
m.show()
