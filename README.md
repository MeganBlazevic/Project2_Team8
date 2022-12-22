# Project 2 ETLs | Team 8

## Original Project Task
Working with a partner, we were asked to complete an ETL (Extract, Transform, and Load) process on a data set of our choosing. We were asked to determine our data sources, extract the data, transform the data, and then load it into a database.

### Our Project
We have been asked to consult for a new start up PyGoods.  PyGoods is looking to determine the best locaiton for their new business model that contains different goods and services.  The focus of PyGoods is to do Good for their new community. We have been brought in to help look at the GDP (Gross Domestic Product) as an estimate of wealth by county; and then determinig how that compares to life expectency, unemployment, educational levels. 

Utilizing the ETL process the data to look at how the counties are related, and help PyGoods determine their top locaiton choices for their new business.   

### Team Members
- Megan Blazevic
- Omar Espinoza

## Proposal
Creating PyGoods a relational database to query the FIPS (Federal Information Processing Series) code in relation to life expectency, poverty estimates, and educational status; so a new headquarters can be built.  

## Report
Once we focused on the topic of data surrounding Gross Domestic Product, we started to look for various data sources. Once we found our GDP data, we thought about what could be connected to that data to help drive the the variations. We decided to look into life expectency, education level, and poverty estimates for each county across the United States.

## 1. Extract
We obtained our .csv data files from several different sites. After inspecting several of our data sets (looking for completeness, ease of use, data variables, etc.); a few of our original sources (a Kaggle data sete for GDP and a Center for Disease Control and Prevention data set for life expectency) were abondanded and new sources were obtained. The Kaggle data was in an excel .xlsx data set that was more difficult to use, so an alternitive source was sought out. The CDC data set was abanded as it didn't have the FIPS code.  In hindsight, we could have continued with this data set and linked it with other informaiton to add the FIPS code in with the informaiton as the FIPS code is our primary key. 

### Sources
 1. Gross Domestic Product by County data came from ArcGIS Hub 
    https://hub.arcgis.com/datasets/esri::gross-domestic-product-gdp-by-county-2012-to-2015/explore
 2. Life Expectancy (mortality risk) data came from DataWorld 
    https://data.world/
 3. Poverty estimates for the US, States and Counties data come from the US Department of Agriculture - Economic Research Service 
    https://www.ers.usda.gov/webdocs/DataFiles/48747/PovertyEstimates.xlsx?v=1600.8
 4. Educational Attainment for Adults Age 25 and Older data came from the US Department of Agriculture - Economic Research Service 
    https://www.ers.usda.gov/webdocs/DataFiles/48747/Education.xlsx?v=1600.8
 5. List of County and State FIPS codes came from the US Census Bureau 
    https://www.census.gov/library/reference/code-lists/ansi.html#county
 6. List of State Abbreviations came form the Census Bureau
    https://www2.census.gov/geo/docs/reference/state.txt

## 2. Transform
As we were utilizing various data sets, we needed to clean up the data to work best for our PyGoods analysis. Transformation is done to clean the data to make it complete and concise data. The data was pulled into our jupyter notebook; and utilizing pandas we read in our data files. Basic formating was done to most of the data sets to clean. This would include adding underscores, and taking out dashes and spaces; ensuring that each column had headers; adjusting column names to make them shorter, but still ensuring that they were appropriate indicators of the columns. Extracting the State out of the combined County, State fields.  Extra columns with older data (previous years) and unnecessary informaiton was ommitted from our data set. Extracting of the first number (average life expectency) from 3 different values (showing average, male average, and female averages). Data with null values were dropped as well. 

### Data Sets 

* List of FIPS Codes
    - Source of data: US Census Bureau
    - URL of data: https://www.census.gov/library/reference/code-lists/ansi.html#county
    -  Original name of dataset: national_county FIPS.txt
    - Extract and transform:
        - Read file into a dataframe
        - Create new data frame with select columns, and rename columns
            Extract “County” from the county names (e.g. “Autauga County” to “Autauga”)

* List of State Abbreviations
    - Source of data: U.S. Census Bureau
    - URL of data: https://www2.census.gov/geo/docs/reference/state.txt
    - Original name of dataset: state_codes.csv
    - Extract and transform:
        - Read file into a dataframe
        - Create new data frame with select columns, and rename columns

* Education dataset
    - Source of data: U.S. Department of Agriculture - Economic Research Service
    - URL of data: https://www.ers.usda.gov/webdocs/DataFiles/48747/Education.xlsx?v=1600.8
    - Original name of dataset: Education.xlsx
    - Extract and transform:
        - Read file into a dataframe
        - Replace spaces in headers with underscores
        - Create new data frame with select columns, and rename columns
            Extract “County” from the county names (e.g. “Autauga County” to “Autauga”)
        - Convert FIPS column to string

* Gross Domestic Product (GDP) dataset
    - Source of data: ArcGIS Hub
    - URL of data: https://hub.arcgis.com/datasets/esri::gross-domestic-product-gdp-by-county-2012-to-2015/explore
    - Original name of dataset: Gross_Domestic_Product_(GDP)_by_County%2C_2012_to_2015.csv
    - Extract and transform:
        - Read file into a dataframe
        - Create new data frame with select columns, and rename columns
        - Reorder columns
        - Inner-join GDP and State Codes datasets, to add state abbreviations
        - Reorder columns
        - Convert FIPS column to string

* Life expectancy dataset
    - Source of data: Data World
    -  URL of data: https://data.world/
    - Original name of dataset: IHME_USA_COUNTY_LE_MORTALITY_RISK_1980_2014_NATIONAL_Y2017M05D08.csv
    - Extract and transform:
        - Read file into a dataframe
        - Replace spaces in headers with underscores
        - Create new data frame with select columns, and rename columns     Extract “County” from the county names (e.g. “Autauga County” to “Autauga”)
        - Split County column into two, one for county name and another for state, using comma as delimiter (e.g. from “Baldwin, Alabama” to “Baldwing” and “Alabama”)
        - Eliminate male and female life expectancy numbers, keep overall life expectancy,
        - Rename columns an re-order
        - Join Life Expectancy and State Codes data frames to add state abbreviations
        - Reorder columns
         - Convert FIPS column to string
        - Extract “.0” from all FIPS codes (e.g. “1001.0” to “1001”)

* Poverty
    - Source of data: U.S. Department of Agriculture - Economic Research Service
    - URL of data: https://www.ers.usda.gov/webdocs/DataFiles/48747/PovertyEstimates.xlsx?v=1600.8
    - Original name of dataset: PovertyEstimates.xlsx
    - Extract and transform:
        - Read file into a dataframe
        - Replace spaces in headers with underscores
        - Create new data frame with select columns, and rename columns
            Extract “County” from the county names (e.g. “Autauga County” to “Autauga”)
        -  Convert FIPS column to string

We discussed taking out the state level data (all the FIPS that end in 000), to only show the US counties. Ultimately we decided to keep the state roll-up summary in the data. This can be filtered out during the database options, and used to help narrow down different states or regions. With their being 3241 FIPS codes across the country; using the state level FIPS, will help to narrow down the data dive.

All of the data sets (GDP, life expectency, poverty, and education level) were all joined via a .merge option. Then data cleaning was done again to delete duplicate rows, reordering of the data columns, and deleting of the duplicate columns.

### Data Merge
- Merging 4 datasets into one
    - Join all tables on FIPS
    - Delete duplicate columns
        - Reorder and rename columns
        - Convert FIPS from string to integer
        - Set FIPS as index

## 3. Load
Our schema is fairly simple. We have 1 table; as our original data sets were all able to be connected through the primary key of the FIPS. As the FIPS are a graet identifier (just 4-5 characters), and it was in all of the data sets, it made merging our data set ideal. We didn't have to link any of the tables together to accomplish the data loading. 

  ![QuickDBD-Free Diagram](https://user-images.githubusercontent.com/113635771/209032900-2dd8e0d7-fdf4-4ff9-893e-08f13d905c3b.png)

To load the data into the data set; we connected to our relational database.
- Connect and create table
    - Import squalachemy and create engine
    - Load main dataframe into SQL table.

### Sample Queries  
Here is a sampling of some of the data queries that can easily be done with our relational database.

****************

### Future Adjustments.  
Once PyGoods has solidified its location and built their headquarters, they would be able to load in new data as to the headquarters county; to see if they were able to do good within the community, by influencing some of the benchmarking stats (life expectency, GDP, educaiton level, poverty status).

### Limitations
Working with data sets of the same year. Many of the trends did not very much over the years, so we were able to use various years in our data set. Ideally, using all data from a specific year, or yearly range; would have been ideal.
