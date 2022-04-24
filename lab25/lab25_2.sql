CREATE SEQUENCE discip_id;

INSERT INTO discipline (id, descr) VALUES (nextval('discip_id'), 'Math');
INSERT INTO discipline (id, descr) VALUES (nextval('discip_id'), 'Physics');
INSERT INTO discipline (id, descr) VALUES (nextval('discip_id'), 'Computer Science');
INSERT INTO discipline (id, descr) VALUES (nextval('discip_id'), 'History');
INSERT INTO discipline (id, descr) VALUES (nextval('discip_id'), 'Foreign Language');

