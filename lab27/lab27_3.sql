INSERT INTO noaa_sample."owner" SELECT * FROM noaa_sample.owner_csv ON CONFLICT (id) DO UPDATE 
	SET name = excluded.name;

INSERT INTO noaa_sample."program" SELECT * FROM noaa_sample.program_csv ON CONFLICT (id) DO UPDATE 
        SET name = excluded.name;

INSERT INTO noaa_sample."station" SELECT * FROM noaa_sample.station_csv ON CONFLICT (id) DO UPDATE 
        SET name = excluded.name;

