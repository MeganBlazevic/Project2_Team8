select * from human_development_indicators

-- Average percent of population with less than high school education and average poverty
SELECT "State", round(AVG("Less_than_HS")::numeric,2) AS "Average pct with less than High School", round(AVG("Poverty_pct")::numeric,2) AS "Average Poverty"
FROM human_development_indicators
GROUP BY "State"
ORDER BY "State";

-- Average percent of population with BS or higher and GDP in Minnesota
SELECT "County", round(AVG("BS_or_higher")::numeric,2) AS "Average pct with BS-higher", round(round(AVG("GDP_2015")::numeric,0)/1000000,2) AS "Average GDP (million $)"
FROM human_development_indicators
WHERE "State" = 'MN'
GROUP BY "County"
ORDER BY "County";