CREATE TABLE student(
id int CONSTRAINT pk_stud PRIMARY KEY,
first varchar(50),
last varchar(50),
sex char(1)
);

CREATE TABLE mark(
id int CONSTRAINT pk_mark PRIMARY KEY,
exam int NOT NULL,
stud int NOT NULL,
res int
);

CREATE TABLE exam(
id int CONSTRAINT pk_exam PRIMARY KEY,
discip int NOT NULL,
ts timestamp 
);

CREATE TABLE discipline(
id int CONSTRAINT pk_disc PRIMARY KEY,
descr varchar(50)
);
