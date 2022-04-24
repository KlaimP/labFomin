CREATE SEQUENCE mark_id;

CREATE OR REPLACE PROCEDURE fill_marks() LANGUAGE plpgsql AS
$$
	DECLARE
		i int;
		j int;
	BEGIN
		FOR i IN (SELECT id FROM exam) LOOP
			j = 1 + random() * (5 - 1);
			INSERT INTO mark(id, exam, stud, res)
				SELECT nextval('mark_id'), i, id,
				2 + random() * (5 - 2) FROM student WHERE random() < 0.10;
		END LOOP;
	END;
$$;

CALL fill_marks();
