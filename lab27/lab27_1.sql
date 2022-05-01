CREATE TABLE owner(
id int CONSTRAINT pk_owner PRIMARY KEY,
name varchar(150)
);

CREATE TABLE program(
id int CONSTRAINT pk_program PRIMARY KEY,
name varchar(100)
);

CREATE TABLE station(
id varchar(20) CONSTRAINT pk_station PRIMARY KEY,
owner int NOT NULL,
program int NOT NULL,
lat double precision,
lon double precision,
elev double precision,
data char,
status char,
type varchar(20),
name varchar(100)
);

CREATE TABLE data(
id int CONSTRAINT pk_data PRIMARY KEY,
station varchar NOT NULL,
datetime timestamp,
height double precision,
t int
);

ALTER TABLE noaa_sample.station ADD CONSTRAINT owner_station FOREIGN KEY ("owner") 
	REFERENCES noaa_sample."owner" (id);

ALTER TABLE noaa_sample.station ADD CONSTRAINT program_station FOREIGN KEY ("program") 
        REFERENCES noaa_sample."program" (id);

ALTER TABLE noaa_sample."data" ADD CONSTRAINT station_data FOREIGN KEY (station) 
        REFERENCES noaa_sample.station (id);

