-- Output 1
select
(select first_value(id) over() from Q4_data where id is not NULL LIMIT 1) as id,
(select first_value(name) over() from Q4_data where name is not NULL LIMIT 1) as name,
(select first_value(location) over() from Q4_data where location is not NULL LIMIT 1) as location;

-- Output 2
select
(select last_value(id) over() from Q4_data where id is not NULL LIMIT 1) as id,
(select last_value(name) over() from Q4_data where name is not NULL LIMIT 1) as name,
(select last_value(location) over() from Q4_data where location is not NULL LIMIT 1) as location;
