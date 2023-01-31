--Aggregate Min-Max Function
SELECT concat_ws(' -> ', MIN(column_name), MAX(column_name)) FROM your_table_name;

--For wider datatypes
SELECT concat_ws(' -> ', COALESCE(MIN(column_name), 'NULL'), COALESCE(MAX(column_name), 'NULL')) FROM your_table_name;


--Configurable
WITH data as (SELECT column_name FROM your_table_name)
, format_string as ('min' || :delimiter || 'max')
SELECT (concat_ws(:delimiter, COALESCE(MIN(column_name), 'NULL'), COALESCE(MAX(column_name), 'NULL'))) 
FROM data;