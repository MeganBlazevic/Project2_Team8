-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/Upk5Nf
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "human_development_indicators" (
    "FIPS" int   NOT NULL,
    "State" varchar   NOT NULL,
    "State_name" varchar   NOT NULL,
    "County" varchar   NOT NULL,
    "Less_than_HS" float   NOT NULL,
    "HS" float   NOT NULL,
    "Some_college" float   NOT NULL,
    "BS_or_higher" float   NOT NULL,
    "GDP_2015" float   NOT NULL,
    "Poverty_pct" float   NOT NULL,
    "Life_expectancy" float   NOT NULL,
    CONSTRAINT "pk_human_development_indicators" PRIMARY KEY (
        "FIPS"
     )
);

