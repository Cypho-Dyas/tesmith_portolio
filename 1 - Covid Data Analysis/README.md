# Covid Data Analysis Project

## Skills Displayed 

Data Cleaning, Exploratory Data Analysis (PostgreSQL), Data visualization (Tableau)

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

In total, the dataset contains data regarding covid cases, deaths, vaccinations, hospitalizations, and testing. 

## Data Cleaning

The dataset was already thoroughly clean considering the agency that collected it, with the biggest issue being null values for many rows. As the data was collected live during the pandemic  certain fields only applied after a specific point in time (e.g., there is no data for vaccinations for dates prior to the development/implementation of the vaccine). 

For cleaning I mostly needed to change some formats (such as the date) to load into PostgreSQL a bit easier. I decided not to address null values as doing so could significantly impact other fields and both SQL and Tableau have the means to let me skirt null values when appropriate. I also wanted to take this time to split the dataset into seperate related tables for simplicity, knowing that I intended to join the relevant data in SQL for data exloration. This would also allow me to mimic a real world relational data base. 

With this in mind I used load/transform in Microsoft Excel's PowerQuery to pull in the entire dataset and make the needed changes before splitting the entire dataset into five unique tables: covid_deaths, covid_hospitals, covid_vaccines, covid_populations, and covid_tests. 

Each table was subsequently saved into a Comma Seperated Values (CSV) file and saved to a public folder on my personal computer to be loaded into my PostgreSQL server. 

