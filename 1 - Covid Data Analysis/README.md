# Covid Data Analysis Project

## Skills Displayed 

Data Extraction/Transformation/Loading (ETL), Data Cleaning, Exploratory Data Analysis (PostgreSQL), Data visualization (Tableau)

## The Data

The data was collected from [ourworldindata.org](https://ourworldindata.org/covid-deaths) on the 1st of February 2023. The dataset in its entirety contains covid and population data collected from as early as January 2020 for over a hundred countries. 

Some examples of the columns found in the dataset include:

* Continent
* Location
* Population
* Total Cases
* Total Cases per Million
* Total Deaths
* Total Deaths per Million
* People Vaccinated
* People Fully Vaccinated
* GDP per Capita

In total, the dataset contains data regarding covid cases, deaths, populations, vaccinations, hospitalizations, and testing. 

## Data Cleaning

The dataset was already thoroughly clean considering the agency that collected it, with the biggest issue being null values for many rows. As the data was collected live during the pandemic  certain fields only applied after a specific point in time (e.g., there is no data for vaccinations for dates prior to the development/implementation of the vaccine). 

For cleaning I mostly needed to change some formats (such as the date) to load into PostgreSQL a bit easier. I decided not to address null values as doing so could significantly impact other fields and both SQL and Tableau have the means to let me skirt null values with aggregate functions when appropriate. I also wanted to take this time to split the dataset into separate related tables for simplicity, knowing that I intended to join the relevant data in SQL for data exploration. This would also allow me to mimic a real world relational database. 

With this in mind I used load/transform in Microsoft Excel's Power Query to pull in the entire dataset and make the needed changes before splitting the entire dataset into five unique tables: covid_deaths, covid_hospitals, covid_vaccines, covid_populations, and covid_tests. 

Each table was subsequently saved into a Comma Separated Values (CSV) file and saved to a public folder on my personal computer to be loaded into my PostgreSQL server. 

## Exploratory Data Analysis in PostgreSQL

The data was explored using the PostgreSQL RDBMS. A copy of the code can be found here: [PostgreSQL EDA Code](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/1%20-%20Covid%20Data%20Analysis/Covid%20Data%20Analysis%20Project%20EDA.sql) 

After concluding the initial analysis, I had a fairly good idea of the *high-level* visualizations I wanted to make, however I also wasn't sure if I would want to come back to this project at a later date to expand upon it as there was a large amount of data that I did not touch upon for this initial visualization. I decided to create a view of the most promising fields from all five tables and exported that to a CSV for visualization in Tableau. This would allow me to come back and enhance/add visualizations at a later date if I decided to revisit the project without having to delve back into the CSV files or PostgreSQL.

## Visualization

Once in Tableau I decided to create three separate dashboards: 

1. A dashboard to track global case information
2. A dashboard to track global death information
3. A dashboard to track global vaccine information.

I wanted each dashboard to be as interactive as possible to allow viewers to draw their own conclusions from the data. Multiple fields were aggregated and calculated fields were created where necessary to capture the specialized aggregations or ratios that were ultimately used in each dashboard, especially in the *KPIs* sections at the top. 

### Dashboard #1: Covid Cases

![Covid Cases Dashboard](



