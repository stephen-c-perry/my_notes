SHOW DATABASES;

USE join_example_db;

# What's in here?

SHOW TABLES;
# What's in these tables specifically?

SELECT * FROM roles;
# fields present: ID, NAME

SELECT * FROM users;
# fields present: id, name, email, role_id

# Our first join: the inner join (Inner join is the sql defaul unless specified)

#Select everything from the users table
SELECT * 
#from the users table
FROM users
#join the roles table in
JOIN roles
#specify how the match between users and roles is made:
ON users.role_id = roles.id;

--

#select specific fields in the context of a join
#tell sql what you want to grab, with dot notation
SELECT users.email, roles.name
FROM users
JOIN roles
ON users.role_id = roles.id;



#We can alias things without as if the alias comes directly after the item you are renaming
#faketablename.fiel, faketablename2.field2


# left and right?
-- take everything
SELECT *
-- users (to start)
FROM users
-- Join roles (with left)
LEFT JOIN roles
-- what pairing?
ON users.role_id = roles.id;

-- takeaways here: everything from usrs is presnt, two rows of info that have users information, but nothing form roles 
-- the cells from roles are filled with null values


-- take that flip it and reverse it
SELECT *
-- roles (to start)

-- ****
-- the first table we choose in FROM is always the left table
-- ****
FROM roles
-- Join users (with left)
LEFT JOIN users
-- what pairing?
ON users.role_id = roles.id;

-- switch to a new schema: world
USE world;

SHOW tables;

#city
-- fields present: ID, name, countrycode, district, population
-- countrycode is a three letter character string
#country
#countrylanguage

SELECT * FROM city LIMIT 5;

SELECT * FROM country LIMIT 5;

SELECT * FROM countrylanguage LIMIT 5;

-- lets link these together!
-- lets use an inner join, and take every field

SELECT *
FROM city
JOIN countrylanguage USING(CountryCode)
JOIN country ON country.Code = countrylanguage.CountryCode;


SELECT *
FROM city
LEFT JOIN countrylanguage USING(CountryCode)
LEFT JOIN country ON country.Code = countrylanguage.CountryCode
LIMIT 5;




