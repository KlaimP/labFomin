import json
import urllib.request as req

req.urlretrieve("http://www.ndbc.noaa.gov/ndbcmapstations.json","ndbcmapstations.json")
f = open("ndbcmapstations.json", "r")
data = json.load(f)
f.close()

own = data['owner']
f = open("owner.csv", "w")
for i in range(0, len(own)):
	name = own[i].replace(",",";")
	f.write(f"{i},{name}\n")
f.close();

prg = data['program']
f = open("program.csv","w")
for i in range(0, len(prg)):
	name = prg[i].replace(",",";")
	f.write(f"{i},{name}\n")
f.close()

sta = data['station']
f = open("station.csv", "w")
for i in range(0, len(sta)):
	id = sta[i]['id']
	owner = sta[i]['owner']
	prog = sta[i]['program']
	lat = sta[i]['lat']
	lon = sta[i]['lon']
	elev = sta[i]['elev']
	if elev == None:
		elev = "NULL"
	data = sta[i]['data']
	stat = sta[i]['status']
	type = sta[i]['type']
	name = sta[i]['name'].replace(",",";")
	f.write(f"{id},{owner},{prog},{lat},{lon},{elev},{data},{stat},{type},{name}\n")
f.close()
