CREATE OR REPLACE PROCEDURE download_dart_dart() LANGUAGE plpython3u AS
$$
	import urllib.request as req

	lst = plpy.execute("SELECT id FROM noaa_sample.station WHERE type = 'dart' AND data = 'y';")
	n = len(lst)
	for i in range(0, len(lst)):
		id = lst[i]["id"]
		plpy.notice(f"downloading {id} ({i + 1} / {n})")
		req.urlretrieve(f"https://www.ndbc.noaa.gov/data/realtime2/{id}.dart", f"/home/postgres/mygit/lab27/data/{id}.txt")
$$;

CREATE OR REPLACE PROCEDURE update_station_data() LANGUAGE plpython3u AS
$$
	lst = plpy.execute("SELECT id FROM noaa_sample.station WHERE type = 'dart' AND data = 'y';")
	n = len(lst)
	for i in range(0, len(lst)):
		id = lst[i]["id"]
		f = open(f"/home/postgres/mygit/lab27/data/{id}.txt", "r")
		s = open(f"/home/postgres/mygit/lab27/data/{id}.txt", "r")
		row = f.read().split("\n")
		m = len(row)-1
		sql = "INSERT INTO noaa_sample.data(station, datetime, height, t) VALUES "
		a = 0
		for j in s:
			if a > 1:
				datee = f"{j[:10].replace(' ', '-')} {j[11:][:8].replace(' ', ':')}"
				t = f"{j[:21][20:]}"
				height = f"{j[22:]}"
				if "MM" in height:
					height = "NULL"
				sql += f"('{id}', '{datee}', {height}, {t})"
				if a < m -1:
					sql+=","
			a=a+1
		sql +=  " ON CONFLICT (station, datetime) DO NOTHING;"
		f.close()
		plpy.execute(sql)
$$;
