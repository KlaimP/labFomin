import psycopg2 as p
import numpy as n
import matplotlib.pyplot as m

con=p.connect("dbname=g394-Podyapolskiy user=postgres host=127.0.0.1 port=5432")

cur=con.cursor()
cur.execute("Select * From lab_partition.fn Order By x;")

arr=cur.fetchall()

cur.close()
con.close()

x ,y = n.array(arr).T

m.plot(x, y)

m.title('curve')
m.xlabel('x')
m.ylabel('y=f(x)')

m.grid(True,which='both')

m.savefig('plaat.png')
m.show()
