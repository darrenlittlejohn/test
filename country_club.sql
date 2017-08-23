CREATE TABLE members (
id SERIAL PRIMARY KEY, 
first_name varchar, 
sur_name varchar, 
address varchar(200), 
zipcode int, 
phone varchar(12), 
email varchar(320),
recommended_by integer REFERENCES members(id),
join_date timestamp
);

ALTER TABLE members
DROP COLUMN recommended_by;

ALTER TABLE members
ADD COLUMN recommended_by integer REFERENCES members(id);

CREATE TABLE facilities (
id SERIAL PRIMARY KEY, 
name varchar, 
member_cost numeric, 
guest_cost numeric,
initial_out_lay numeric,
monthly_maintenance numeric
);

CREATE TABLE bookings (
id SERIAL PRIMARY KEY, 
facility_id int REFERENCES facilities(id), 
member_id int REFERENCES members(id), 
start_time timestamp,
slots int    
);

ALTER TABLE members ALTER COLUMN phone TYPE varchar;

psql country_club < country_club_data_dump.sql

Produce a list of start times for bookings by members named 'David Farrell'?

SELECT bookings.start_time
FROM bookings
JOIN members ON members.id = bookings.member_id
WHERE first_name = 'David'
AND sur_name = 'Farrell';

Produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'

SELECT bookings.start_time
FROM bookings
JOIN facilities ON facilities.id = bookings.facility_id
WHERE facilities.name LIKE 'Tennis%'
AND date_trunc('day', bookings.start_time) = '2012-09-21';

//alternate
WITH tennis_bookings AS (
    SELECT bookings.start_time
FROM bookings
JOIN facilities ON facilities.id = bookings.facility_id
WHERE facilities.name LIKE 'Tennis%'
)
SELECT *
FROM 
  tennis_bookings
  WHERE date_trunc('day', tennis_bookings.start_time) = '2012-09-21';

SELECT bookings.start_time, facilities.name
FROM bookings
JOIN facilities ON facilities.id = bookings.facility_id
WHERE facilities.name LIKE 'Tennis%'
AND date_trunc('day', bookings.start_time) = '2012-09-21'
ORDER BY bookings.start_time;

Produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as first name, surname. Ensure no duplicate data, and order by the first name.

SELECT members.sur_name, members.first_name, facilities.name
FROM members
JOIN facilities ON facilities.id = members.id
WHERE facilities.name LIKE 'Tennis%'
ORDER BY members.sur_name;