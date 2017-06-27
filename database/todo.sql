CREATE TABLE todos (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    details text,
    priority integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    completed_at timestamp without time zone
);


INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task1','wash the car','06-23-2017',NULL);
INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task2','wash the dog','06-23-2017',NULL);
INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task3','wash clothes','06-23-2017',NULL);
INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task4','fold clothes','06-23-2017',NULL);
INSERT INTO todos (title, details, created_at, completed_at) VALUES ('task4','buy groceris','06-23-2017','06-27-2017');

SELECT title FROM todos WHERE completed_at IS NULL;
SELECT * FROM todos WHERE priority > 1;

UPDATE todos SET completed_at = '06-27-2107' WHERE id = '1';

DELETE FROM todos WHERE completed_at = '06-27-2017';
