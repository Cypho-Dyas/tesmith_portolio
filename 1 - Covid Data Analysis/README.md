# Covid Data Analysis Project

## Skills Displayed 

* Data Extraction/Transformation/Loading (ETL)
* Data Cleaning
* Exploratory Data Analysis (PostgreSQL)
* Data visualization (Tableau)

## Reasoning

I chose this data set for a number of reasons, primary of which was my background in the biotech industry, which made doing an analysis of the covid dataset extremely appealing to me. Secondly, I personally believe that there was a large spread of covid disinformation throughout the pandemic, and the information I did receive from news coverage during the time was largely based on my own country, the United States of America (USA). I wanted to compare countries and continents all over the globe to get a real sense of which locations were affected disproportionally in relation to the others, which then may be used to further research the effectiveness of the different medical systems and governments and how they handled the pandemic. 

While there are a multitude of dashboards aimed at delivering up to date covid information the logic and methodology/data aggregation behind them is largely unstated, and I felt that diving into a similar dataset would help me understand better the logic that goes into evaluating a global dataset, which is something I would like to do more in the future. 

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

Once in Tableau I decided to create three separate dashboards to highlight the effects of the covid pandemic globally: 

1. A dashboard to track global case information
2. A dashboard to track global death information
3. A dashboard to track global vaccine information 

I wanted each dashboard to be as interactive as possible to allow viewers to draw their own conclusions from the data. Multiple fields were aggregated and calculated fields were created where necessary to capture the specialized aggregations or ratios that were ultimately used in each dashboard, especially in the *KPIs* sections at the top. 

The three dashboards were compiled into a Tableau *story* format to make viewing/comparing the three simpler for viewers. 

You can access actual dashboards/visuals by visiting my Tableau public profile here: [Tableau Covid Workboook](https://public.tableau.com/app/profile/travis.smith7313/viz/CovidWorkbook_16757822300150/CovidDashboards) 

### Dashboard #1: Covid Cases

![Covid Cases Dashboard](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/1%20-%20Covid%20Data%20Analysis/Covid%20Cases%20Dashboard.PNG)

The first dashboard tracks global covid cases and allows the user to filter down to a specific country if interested by either using the dropdown filter at the top of the page or clicking on any other location based element present on the dashboard (e.g., heatmap, bar/bubble charets, etc.) Alternatively, users can get aggregated data for an entire continent by clicking on any of the continent elements displayed. The KPI's at the top will update based on your selection as long as the data is available. 

The heatmap at the top highlights the countries who have had the most cases per million people. This statistic normalizes the data between countries by focusing the count of cases around a derived unit of the populace and therefore was a great candidate for the map. There are still many variables that could contribute to the number of cases a country has at any given time per million people (land barriers, spread of populace, etc.) but at a high level the cases_per_million data tells a great global story. 

Users can also hover over any country on this map to get a brief timeline of the new cases reported throughout the pandemic to easily assess which portion of which years had the most cases for any individual countries assuming the data was present in the dataset. This is a great tool for quickly comparing case spikes between two countries to get a better idea of who may have had better covid prevention measures in place at any given time.

The charts at the bottom of the dashboard show primarily information by continent, with the exception being the middle chart, which lists the top countries by cases per million people for any given selection. If a continental filter is applied, then this will show the top countries by cases per million for that continent, based on the available data. 

The bottom left-most chart shows the running total of covid cases as of the day before I pulled the data (2023-02-01). If no filter is applied then this is a global running total, broken down by individual continental contributions. If specific country filter is applied, then this will show the running total for that country, with the color indicating the continent that the location belongs to. 

The right-most bottom chart shows the relative size of case distribution per continent, to help the viewer easily get a sense of which parts of the globe were more heavily affected by the spread of the virus. Using this high-level information, the viewer can decide which countries they wish to focus on for more information at any given time. 

### Dashboard #2: Covid Deaths

![Covid Deaths Dashboard](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/1%20-%20Covid%20Data%20Analysis/Covid%20Deaths%20Dashboard.PNG)

This dashboard is largely the same as the previous one, however the data contained pertains to the global deaths reported as a result of the Covid-19 pandemic. I wanted to make a similar dashboard to the covid cases dashboard to allow viewers to quickly compare the amount of covid cases to the amount of covid deaths on a global scale, with the ability to drill down on specific locations as wanted. 

Just as with dashboard #1, the heatmap shows a normalized value of covid deaths per million people for each country. Viewers can hover over any part of the map to see a timeline of new deaths reported throughout the pandemic. Switching between the two dashboards lets the viewer easily compare case spikes with death spikes for any particular location. 

The charts at the bottom also align with those of dashboard #1, except they show the death data in a global-continental context. Death data was analyzed and visualized as a global running total (divided by continent) on the left, with a size comparison of reported death numbers per continent on the right side. The central chart again shows the top countries based on deaths per million people for any applied filter. If no filter is applied, then the middle chart shows the top locations globally, with the bar color indicating the country's continent of origin. 

Again, clicking on any dashboard element will update the KPI's at the top of the visual as long as the data is present. 

### Dashboard #3: Covid Vaccines

![Covid Vaccines Dashboard](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/1%20-%20Covid%20Data%20Analysis/Covid%20Vaccines%20Dashboard.PNG)

This dashboard again shows a heatmap, but this time it is based on the amount of people vaccinated per hundred; showing at a glance which countries have a more vaccinated populace than others. As with the previous two maps viewers can hover over any location on the map to get a timeline of new vaccinations, showing which countries were quickest to get vaccines distributed, and at what points during the pandemic the number of new vaccinations peaked per country. 

The charts at the bottom of this visual show which countries have the most vaccinated populous conveyed as the percentage of the population that has a minimum of one vaccine does (partially vaccinated), and the percentage of the population that has had at least 2 doses (fully vaccinated), respectively. 

The right most chart is a scatter chart of all the locations based on the amount of vaccinations per hundred on the Y-axis and the GDP per capita on the X-axis. I added this chart primarily because I wanted to use some of the more particular population data for this initial project, and I was curious if there was any correlation between GDP per capita and vaccination rates. I will cover the findings of this chart in the *insights* section of this write-up below. 

## Insights

### Covid Cases

Europe has had more of an issue controlling cases than other countries. Specifically, France and many surrounding countries seem to have been disproportionately affected by the Virus during the worst of the pandemic. The close proximity of many of those countries on the top countries by cases per million chart suggests that travel between these countries may have been a significant contributor to the case counts we see here. 

There was a huge spike of cases in the early part of 2022 that affected every country, although some countries have multiple similar spikes, it is easy to see that the initial spike in early 2022 was the worst of the spread during the entire pandemic to date. A bit of global research into this timeframe reveals that this was likely due to a perfect storm of multiple discoveries and governmental regulatory decisions. Namely, this timeframe coincides with the discovery of multiple new sub-variants of the virus, including many sub-variants of the original Omicron variant. 

Additionally, this timeframe coincides with the lifting of several Covid restrictions that had been in place since late 2020/early 2021. This suggests that government regulations and restrictions played an integral role in controlling the spread of the virus while in affect, however; the affects of the early 2022 spike can be seen on a global scale which is obvious when looking at the running total of cases area chart.

It is most likely that this case spike was a result of a combination of the variables mentioned above, but further research/analysis should be conducted to see how much of the spike is attributable to each variable, in order to better understand how human intervention can help prevent the spread of future viruses in a pandemic scenario. 

### Covid Deaths
