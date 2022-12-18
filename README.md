# Project 2 ETLs
## Team 8

Linking GDP (Gross Domestic Product) as an estimate of wealth by county; and then determinig how that compares to life expectency, unemployment, educational levels. Is it related?

Utilizing the ETL (Extract, Transform, and Load) process the data to look at how the counties are related.  

### Team Members
- Megan Blazevic
- Omar Espinoza

## Proposal
Type of final production database (relational or non-relational) that the data will be loaded into.  
Gives a relevant and succinct descrription of findings.

### Sources
 1. Kaggle - GDB data source https://www.kaggle.com/datasets/thedevastator/the-u-s-counties-with-the-highest-gdp
 2. CDC - Life Expentency https://www.cdc.gov/nchs/data-visualization/life-expectancy/index.html 
 3. BEA - GDB Data Source https://www.bea.gov/data/gdp/gdp-county-metro-and-other-areas
 4. USDA - Education & Unemployment https://www.ers.usda.gov/data-products/county-level-data-sets/county-level-data-sets-download-data/
 

## Report
1. #### Extract
    Describe original data source and how the data was formatted.
 
2. #### Transform
    Explain what data cleaning or transformation was performed and why it was needed.

    Life expectancy data will need to be cleaned by county to match the county pull from the GDP data set.
    Unemployment and education level would be merged together upon county.


3. #### Load
    Describe the structure of the final database along with any improvements that could be made for the future.

### Limitations
Ensuring that all the data is looking at the same time frame, or assumptions need to be made.