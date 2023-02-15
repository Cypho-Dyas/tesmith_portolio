--Creating database to house the covid data tables. 
CREATE DATABASE covid_project;

--Creating a table to house the covid deaths data. 

CREATE TABLE IF NOT EXISTS covid_deaths (
	iso_code VARCHAR(50),
	continent VARCHAR(50),
	location VARCHAR(100),
	date DATE,
	total_cases INT,
	new_cases INT,
	new_cases_smoothed NUMERIC(10,3),
	total_deaths INT,
	new_deaths INT,
	new_deaths_smoothed NUMERIC(8,3),
	total_cases_per_million NUMERIC(9,3),
	new_cases_per_million NUMERIC(9,3),
	new_cases_smoothed_per_million NUMERIC(8,3),
	total_deaths_per_million NUMERIC(7,3),
	new_deaths_per_million NUMERIC(6,3),
	new_deaths_smoothed_per_million NUMERIC(6,3),
	reproduction_rate NUMERIC(3,2)
);

--Importing covid deaths csv. 

COPY covid_deaths
FROM 'C:\Users\Public\Covid Data Analysis Project\covid_deaths.csv'
WITH (FORMAT CSV, HEADER);

--Performing a quick data check to validate the covid deaths data import.

SELECT *
FROM covid_deaths
WHERE reproduction_rate IS NOT NULL
LIMIT 1000;

--Creating table to house covid hospitals data.

CREATE TABLE IF NOT EXISTS covid_hospitals (
	iso_code VARCHAR(50),
	continent VARCHAR(50),
	location VARCHAR(100),
	date DATE,
	icu_patients INT,
	icu_patients_per_million NUMERIC(6,3),
	hosp_patients INT,
	hosp_patients_per_million NUMERIC(7,3),
	weekly_icu_admissions INT,
	weekly_icu_admissions_per_million NUMERIC(6,3),
	weekly_hosp_admissions INT,
	weekly_hosp_admissions_per_million NUMERIC(6,3)
);

--Importing covid hospitals csv.
COPY covid_hospitals
FROM 'C:\Users\Public\Covid Data Analysis Project\covid_hospitals.csv'
WITH (FORMAT CSV, HEADER);

--Performing a quick data check to validate the covid hospitals data import.

SELECT *
FROM covid_hospitals
WHERE hosp_patients IS NOT NULL
	AND weekly_hosp_admissions_per_million IS NOT NULL
	AND weekly_icu_admissions_per_million IS NOT NULL
LIMIT 1000;

--Creating a table to house the covid populations data. 

CREATE TABLE IF NOT EXISTS covid_populations (
	iso_code VARCHAR(50),
	continent VARCHAR(50),
	location VARCHAR(100),
	date DATE,
	population BIGINT,
	population_density NUMERIC(8,3),
	median_age NUMERIC(3,1),
	aged_65_older NUMERIC(5,3),
	aged_70_older NUMERIC(5,3),
	gdp_per_capita NUMERIC(9,3),
	extreme_poverty NUMERIC(3,1),
	cardiovasc_death_rate NUMERIC(6,3),
	diabetes_prevalence NUMERIC(4,2),
	female_smokers NUMERIC(3,1),
	male_smokers NUMERIC(3,1),
	handwashing_facilities NUMERIC(6,3),
	hospital_beds_per_thousand NUMERIC(5,3),
	life_expectancy NUMERIC(4,2),
	human_development_index NUMERIC(4,3),
	excess_mortality_cumulative_absolute NUMERIC(8,1),
	excess_mortality_cumulative NUMERIC(4,2),
	excess_mortality NUMERIC(5,2),
	excess_mortality_per_million NUMERIC(8,3)
);

--Importing covid populations csv. 

COPY covid_populations
FROM 'C:\Users\Public\Covid Data Analysis Project\covid_populations.csv'
WITH (FORMAT CSV, HEADER);

--Performing a quick data check to validate the covid populations data import.

SELECT *
FROM covid_populations
WHERE excess_mortality IS NOT NULL
	AND handwashing_facilities IS NOT NULL
	AND extreme_poverty IS NOT NULL
	AND female_smokers IS NOT NULL
LIMIT 1000;

--Creating a table to house the covid tests data. 
CREATE TABLE IF NOT EXISTS covid_tests (
	iso_code VARCHAR(50),
	continent VARCHAR(50),
	location VARCHAR(100),
	date DATE,
	total_tests BIGINT,
	new_tests INT,
	total_tests_per_thousand NUMERIC(8,3),
	new_tests_per_thousand NUMERIC(6,3),
	new_tests_smoothed INT,
	new_tests_smoothed_per_thousand NUMERIC(6,3),
	positive_rate NUMERIC(4,3),
	tests_per_case NUMERIC(8,1),
	tests_units  VARCHAR(50)
);

--Importing covid tests csv. 

COPY covid_tests
FROM 'C:\Users\Public\Covid Data Analysis Project\covid_tests.csv'
WITH (FORMAT CSV, HEADER);

--Performing a quick data check to validate the covid tests data import.

SELECT *
FROM covid_tests
WHERE total_tests IS NOT NULL
	AND new_tests IS NOT NULL
	AND new_tests_smoothed IS NOT NULL
	AND positive_rate IS NOT NULL
LIMIT 1000;

--Creating a table to house the covid vaccines data. 

CREATE TABLE IF NOT EXISTS covid_vaccines (
	iso_code VARCHAR(50),
	continent VARCHAR(50),
	location VARCHAR(100),
	date DATE,
	total_vaccinations BIGINT,
	people_vaccinated BIGINT,
	people_fully_vaccinated BIGINT,
	total_boosters BIGINT,
	new_vaccinations INT,
	new_vaccinations_smoothed INT,
	total_vaccinations_per_hundred NUMERIC(5,2),
	people_vaccinated_per_hundred NUMERIC(5,2),
	people_fully_vaccinated_per_hundred NUMERIC(5,2),
	total_boosters_per_100 NUMERIC(5,2),
	new_vaccinations_smoothed_per_million INT,
	new_people_vaccinated_smoothed INT,
	new_people_vaccinated_smoothed_per_hundred NUMERIC(5,3),
	stringency_index NUMERIC(5,2)
);

--Importing covid vaccines csv. 

COPY covid_vaccines
FROM 'C:\Users\Public\Covid Data Analysis Project\covid_vaccines.csv'
WITH (FORMAT CSV, HEADER);

--Performing a quick data check to validate the covid vaccines data import.

SELECT *
FROM covid_vaccines
WHERE 
	continent IS NOT NULL
	AND total_vaccinations IS NOT NULL
	AND people_fully_vaccinated IS NOT NULL
	AND total_boosters IS NOT NULL
	AND new_vaccinations IS NOT NULL
LIMIT 1000;

-- Looking at total recorded cases globally.

SELECT
	SUM(new_cases)
FROM covid_deaths
WHERE continent IS NOT NULL;

--Looking for the month/year with the largest case spike in new cases per location. 

WITH cte AS (
	SELECT
		location,
		DATE_TRUNC('MONTH', date) :: DATE AS date,
		MAX(new_cases) AS max_new_cases,
		DENSE_RANK() OVER(PARTITION BY location ORDER BY MAX(new_cases) DESC) AS rank
	FROM covid_deaths
	WHERE continent IS NOT NULL
	GROUP BY location, DATE_TRUNC('MONTH', date) :: DATE
	HAVING MAX(new_cases) IS NOT NULL
		AND MAX(new_cases) > 0
	ORDER BY location
)

SELECT
	location,
	date,
	max_new_cases
FROM cte
WHERE rank = 1
ORDER BY max_new_cases DESC;

--Total cases per country in relation to country population.

SELECT 
	deaths.location,
	MAX(pop.population) AS location_population,
	MAX(deaths.total_cases) AS covid_cases,
	ROUND(MAX(deaths.total_cases)::DECIMAL / MAX(pop.population)::DECIMAL * 100, 2)  AS cases_as_perc_popuation
FROM covid_deaths AS deaths
LEFT JOIN covid_populations AS pop
ON deaths.iso_code = pop.iso_code
	AND deaths.continent = pop.continent
	AND deaths.location = pop.location
	AND deaths.date = pop.date
WHERE deaths.total_cases IS NOT NULL
	AND pop.population IS NOT NULL
GROUP BY deaths.location
ORDER BY cases_as_perc_popuation DESC;

--Total cases per continent 

SELECT
	continent,
	SUM(new_Cases) AS total_cases,
	DENSE_RANK() OVER(ORDER BY SUM(new_cases) DESC) AS continent_rank
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_cases DESC;

--Top countries based on cases per million people. 

SELECT
	location,
	MAX(total_cases_per_million) :: INTEGER AS max_total_cases_per_million
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY location
HAVING MAX(total_cases_per_million) IS NOT NULL
ORDER BY max_total_cases_per_million DESC
LIMIT 30;

--Total recorded deaths globally.

SELECT
	SUM(new_deaths)
FROM covid_deaths
WHERE continent IS NOT NULL;

--Looking at the month/year with the worst rate of deaths 

WITH cte AS (
	SELECT
		location,
		DATE_TRUNC('MONTH', date) :: DATE AS date,
		MAX(new_deaths) AS max_new_deaths,
		DENSE_RANK() OVER(PARTITION BY location ORDER BY MAX(new_deaths) DESC) AS rank
	FROM covid_deaths
	WHERE continent IS NOT NULL
	GROUP BY location, DATE_TRUNC('MONTH', date) :: DATE
	HAVING MAX(new_deaths) IS NOT NULL
		AND MAX(new_deaths) > 0
	ORDER BY location
)

SELECT
	location,
	date,
	max_new_deaths
FROM cte
WHERE rank = 1
ORDER BY max_new_deaths DESC;

--Total deaths per country in relation to country population.

SELECT 
	deaths.location,
	MAX(pop.population) AS location_population,
	MAX(deaths.total_deaths) AS covid_deaths,
	ROUND(MAX(deaths.total_deaths)::DECIMAL / MAX(pop.population)::DECIMAL * 100.0, 2) AS deaths_as_perc_popuation
FROM covid_deaths AS deaths
LEFT JOIN covid_populations AS pop
ON deaths.iso_code = pop.iso_code
	AND deaths.continent = pop.continent
	AND deaths.location = pop.location
	AND deaths.date = pop.date
WHERE deaths.total_deaths IS NOT NULL
	AND pop.population IS NOT NULL
GROUP BY deaths.location
ORDER BY deaths_as_perc_popuation DESC;

/*Covid deathrate per country(percentage of total cases that result in death).
Eliminated outliers that were obviously the result of errouneous data (e.g., countries whose covid deathrate was greater than 100% of cases).*/

SELECT
	location,
	MAX(total_cases) AS total_country_covid_cases,
	MAX(total_deaths) AS total_country_covid_deaths,
	ROUND(MAX(total_deaths)::DECIMAL / MAX(total_cases)::DECIMAL * 100.0, 2) AS covid_deathrate
FROM covid_deaths
WHERE total_cases IS NOT NULL
	AND total_deaths IS NOT NULL
	AND continent IS NOT NULL
	--AND location LIKE '%States%'
GROUP BY location
HAVING ROUND(MAX(total_deaths)::DECIMAL / MAX(total_cases)::DECIMAL * 100.0, 2) < 100.0
ORDER BY covid_deathrate DESC;

--Total deaths by continent
SELECT
	continent,
	SUM(new_deaths) AS total_deaths
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY total_deaths DESC;

--Top countries by deaths per million people
SELECT
	location,
	MAX(total_deaths_per_million) :: INTEGER AS max_total_deaths_per_million
FROM covid_deaths
WHERE continent IS NOT NULL
GROUP BY location
HAVING MAX(total_deaths_per_million) IS NOT NULL
ORDER BY max_total_deaths_per_million DESC
LIMIT 30;

--Vaccination rates per country where the data is available (where people_vaccinated = number of population that have recieved at least 1 vaccine dose).
--Elimating outliers that are the result of obvious erroneous data collection (e.g., countries who have vaccinated more people than their recorded populations).
SELECT 
	vacc.location,
	MAX(vacc.people_vaccinated) AS total_vaccinations,
	MAX(pop.population) AS total_population,
	ROUND(MAX(vacc.people_vaccinated)::DECIMAL / MAX(pop.population)::DECIMAL * 100.0, 2) AS vaccination_rate
FROM covid_vaccines AS vacc
LEFT JOIN covid_populations AS pop
ON vacc.iso_code = pop.iso_code
	AND vacc.continent = pop.continent
	AND vacc.location = pop.location
	AND vacc.date = pop.date
WHERE pop.population IS NOT NULL
	AND vacc.people_vaccinated IS NOT NULL
GROUP BY vacc.location
HAVING ROUND(MAX(vacc.people_vaccinated)::DECIMAL / MAX(pop.population)::DECIMAL * 100.0, 2) < 100.0
ORDER BY vaccination_rate DESC;

--Percentage of populations that are fully vaccinated.
--Elimating outliers that are the result of obvious erroneous data collection (e.g., countries who have vaccinated more people than their recorded populations).
SELECT 
	vacc.location,
	MAX(vacc.people_fully_vaccinated) AS people_fully_immunized,
	MAX(pop.population) AS total_population,
	ROUND(MAX(vacc.people_fully_vaccinated)::DECIMAL / MAX(pop.population)::DECIMAL * 100.0, 2) AS perc_pop_fully_vaccinated
FROM covid_vaccines AS vacc
LEFT JOIN covid_populations AS pop
ON vacc.iso_code = pop.iso_code
	AND vacc.continent = pop.continent
	AND vacc.location = pop.location
	AND vacc.date = pop.date
WHERE pop.population IS NOT NULL
	AND vacc.people_fully_vaccinated IS NOT NULL
GROUP BY vacc.location
HAVING ROUND(MAX(vacc.people_fully_vaccinated)::DECIMAL / MAX(pop.population)::DECIMAL * 100.0, 2) < 100.0
ORDER BY perc_pop_fully_vaccinated DESC;

--Ranking the countries based on their the amount new tests performed each day since the start of the pandemic. 
--Aggregating the test amounts for a better high-level view. Elinating obvious outliers for a better view. 
SELECT
	location,
	ROUND(AVG(total_tests_per_thousand), 2) AS avg_tests_performed_per_thousand_people,
	DENSE_RANK() OVER(ORDER BY ROUND(AVG(total_tests_per_thousand), 2) DESC) AS testing_rank
FROM covid_tests
WHERE total_tests_per_thousand IS NOT NULL
GROUP BY location
HAVING ROUND(AVG(total_tests_per_thousand), 2) < 10000
ORDER BY testing_rank ASC;

	
--Creating a view of the most promising fields from each table for easier data exploration/visualization.
CREATE VIEW general_covid_data AS
SELECT
	deaths.iso_code,
	deaths.continent,
	deaths.location,
	deaths.date,
	deaths.total_cases,
	deaths.new_cases,
	deaths.total_deaths,
	deaths.new_deaths,
	deaths.total_cases_per_million,
	deaths.total_deaths_per_million,
	hosp.icu_patients,
	hosp.icu_patients_per_million,
	hosp.weekly_icu_admissions,
	hosp.weekly_icu_admissions_per_million,
	hosp.hosp_patients,
	hosp.hosp_patients_per_million,
	hosp.weekly_hosp_admissions,
	hosp.weekly_hosp_admissions_per_million,
	tests.total_tests,
	tests.new_tests,
	tests.total_tests_per_thousand,
	tests.new_tests_per_thousand,
	pop.population,
	pop.aged_65_older,
	pop.aged_70_older,
	pop.gdp_per_capita,
	pop.handwashing_facilities,
	pop.hospital_beds_per_thousand,
	vacc.total_vaccinations,
	vacc.people_vaccinated,
	vacc.new_vaccinations,
	vacc.people_fully_vaccinated,
	vacc.total_boosters,
	vacc.total_vaccinations_per_hundred,
	vacc.people_vaccinated_per_hundred,
	vacc.people_fully_vaccinated_per_hundred,
	vacc.total_boosters_per_100
FROM covid_deaths AS deaths
INNER JOIN covid_hospitals AS hosp
ON deaths.iso_code = hosp.iso_code
	AND deaths.continent = hosp.continent
	AND deaths.location = hosp.location
	AND deaths.date = hosp.date
INNER JOIN covid_tests AS tests
ON deaths.iso_code = tests.iso_code
	AND deaths.continent = tests.continent
	AND deaths.location = tests.location
	AND deaths.date = tests.date
INNER JOIN covid_populations AS pop
ON deaths.iso_code = pop.iso_code
	AND deaths.continent = pop.continent
	AND deaths.location = pop.location
	AND deaths.date = pop.date
INNER JOIN covid_vaccines AS vacc
ON deaths.iso_code = vacc.iso_code
	AND deaths.continent = vacc.continent
	AND deaths.location = vacc.location
	AND deaths.date = vacc.date;
	
--Exporting my new view to a csv file for tableau visualization.
COPY (SELECT *
FROM general_covid_data)
TO 'C:\Users\Public\Covid Data Analysis Project\general_covid_data.csv'
WITH (FORMAT CSV, HEADER);

