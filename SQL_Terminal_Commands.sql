CREATE TABLE persons (
id serial PRIMARY KEY, 
given_name varchar, 
family_name varchar, 
address varchar(200), 
age int, 
dob timestamp, 
email varchar(320)
);


INSERT INTO persons (given_name, family_name, address, age, dob, email)
VALUES ('Darren', 'Littlejohn', '3036 Hawthorn, #4, San Diego, CA, 92104', 37, '1962-06-02','darrenblittlejohn@gmail.com'),

('Lou', 'Stepanek', 'Alsip, ILL', 42, '1962-06-02','loustepanek@gmail.com'),

('Cheryl', 'Arnold', 'Blue Island, ILL, 95125', 67, '1962-06-02','cheryl@gmail.com'),

('Pam', 'Stepanek', 'Alsip, ILL, 95125', 57, '1962-06-02','pam@gmail.com'),

('Kristen', 'Stepanek', 'Alsip, ILL, 95125', 27, '1962-06-02','kristen@gmail.com');

DELETE FROM persons
WHERE given_name='Darren';

UPDATE
    persons
    SET
    family_name = 'Littlejohn'
    WHERE 
    family_name <> 'Littlejohn';

UPDATE * FROM persons 
WHERE family_name <> 'Littlejohn';

DELETE FROM
    persons
  WHERE
    address LIKE '%Alsip%';
