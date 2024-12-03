 Would it be possible to compare the overall rating and potential rating per nationality for each player?’

-- create a local temporary table
CREATE TEMP TABLE BrightFutures_temp2(
player_id SERIAL PRIMARY KEY,
player_name VARCHAR (50),
Overall INTEGER,
Potential INTEGER,
Nationality VARCHAR (50),
Wage_Euro_k INTEGER,
Height_cm INTEGER,
Weight_cm INTEGER);

SELECT * 
FROM BrightFutures_temp2;

COPY BrightFutures_temp2 (player_id, player_name, Overall, Potential, Nationality, Wage_Euro_k, Height_cm, Weight_cm)
FROM STDIN
DELIMITER ',' 
CSV HEADER;

COPY BrightFutures_temp2 (player_id, player_name, Overall, Potential, Nationality, Wage_Euro_k, Height_cm, Weight_cm)
FROM STDIN
DELIMITER ','
CSV HEADER;
