CREATE FUNCTION data_insert_func() RETURNS TRIGGER LANGUAGE plpgsql AS
$$
	BEGIN
		IF (NEW.datetime >= '2022-03-01' AND NEW.datetime < '2022-04-01') THEN
		INSERT INTO datay2022m03 VALUES (NEW.*);
		ELSEIF (NEW.datetime >= '2022-04-01' AND NEW.datetime < '2022-05-01') THEN
		INSERT INTO datay2022m04 VALUES (NEW.*);
		ELSE
		RAISE EXCEPTION 'timestamp is out of range';
		END IF;
		RETURN NULL;
	END;
$$;

CREATE TRIGGER data_insert_trig BEFORE INSERT ON "data_part"
	FOR EACH ROW EXECUTE PROCEDURE data_insert_func();
