select
(select last_value(car) over() from FOOTER where car is not NULL LIMIT 1) as car,
(select last_value(length) over() from FOOTER where length is not NULL LIMIT 1) as length,
(select last_value(width) over() from FOOTER where width is not NULL LIMIT 1) as width,
(select last_value(height) over() from FOOTER where height is not NULL LIMIT 1) as height;