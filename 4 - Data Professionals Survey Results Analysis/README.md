# Data Professional Survey Results Analysis

## Skills Displayed

- Data Cleaning (Power Query)
- Data Analysis
- Data Visualization (Power BI)

## Reasoning
I chose this dataset to gain insights into the world of data professionals both internationally and domestically. This is crucial for me as I'm currently job hunting in this field and want to be prepared for what lies ahead. Additionally, I aim to enhance my skills and understand which ones are valuable for my job search. This project will serve as a great opportunity to showcase my Power BI expertise and fulfill my goal of having two projects each for Power BI and Tableau in my portfolio.

## The Data

This dataset was obtained from Alex Freburg's [GitHub page](https://github.com/AlexTheAnalyst/Power-BI/blob/main/Power%20BI%20-%20Final%20Project.xlsx), resulting from an international survey conducted by Alex himself. It includes responses from hundreds of global data professionals to simple data-related questions.

The raw data is in a Microsoft Excel .xlxs file. Instead of manually cleaning it in Excel, I imported the file directly into Power BI and used Power Query for cleaning.

The data file has columns representing survey questions and observations representing unique survey respondents and their answers.

A non exhaustive list of the fields present in the data file are shown below for reference:

- Unique ID
- Date Taken (America/New York)
- Time Taken (America/New York)
- Time Spent
- Q1 - Which Title Best Fits your Current Role?
- Q2 - Did you switch Careers into Data?
- Q3 - Current Yearly Salary (in USD)
- Q4 - What Industry do you work in?
- Q5 - Favorite Programming Language
- Q6 - How Happy are you in your Current Position with the following? (Work/Life Balance)
- Q7 - How difficult was it for you to break into Data?
- Q8 - If you were to look for a new job today, what would be the most important thing to you?
- Q9 - Male/Female?
- Q10 - Current Age
- Q11 - Which Country do you live in?
- Q12 - Highest Level of Education
- Q13 - Ethnicity

## Data Cleaning
Thanks to data validation techniques applied during the collection phase, the data set was not as dirty as some of the recent ones I have worked with. Still, there was work that needed to be done to get the data in a clean and structured state prior to visualization. 

Below is a list of the data cleaning steps taken to get the data into a useable state for my visualization:

1. Deleted empty or otherwise extraneous fields.
2. Used column split on delimiter to condense job titles for respondents who used the "other" option to write in their job title for Q1; removed specific title to leave only "other" as the answer.
3. Repeated step 2 for Q4 - Which Industry do you work in?
4. Repeated step 2 for Q5 - Favorite Programming Language.
5. Repeated step 2 for Q11 - Which Country do you live in?
6. created a calculated field to average the salary range given by all respondents, generating a new value more useable for the visualization. 
7. Trimmed all fields
8. Completed a final check on all data, removing or imputing any null values and ensuring that data type aligned with the data and that no prefixes/suffixes were going to hinder the visualization process.

## Visualization
The transformed data was loaded into Power BI and visualization began.

Some of the items I knew I wanted to include going in were the count, average age, average salary rating, and average work/life balance rating of the survey participants. Knowing these things was especially important to me personally as I begin my job hunt. Further, I wanted to know how these items, in addition to the other parts of the visualization, would change depending on the country selection, so I added a tree map to show the distribution of respondents per country and to allow filtering based on specific country selection.

The other items I was interested in were respondents favorite programming language (showing which was more popular amongst data professionals), the average salary per each unique job title, and the salary difference for the genders. I built the remaining graphs accordingly to show comparisons for each question posed based on those interests. 

Finally, I applied a simple theme to the entire visualization and used visible borders to differentiate each of the charts, leaving a cleaner presentation against a dark background. 

One interesting thing about Microsoft Power BI currently is that it has integrated accessibility themes for visually impaired viewers. I always want to incorporate DEI measures into my work when possible, so I decided to play around with these themes to see how they worked and how they can be applied to visualizations in Power BI for future reference. 

You can see a screenshot of the completed dashboard, along with an additional screenshot of the accessible version below:

![Data Professional Survey Results Analysis Dashboard](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/4%20-%20Data%20Professionals%20Survey%20Results%20Analysis/Data%20Professionals%20Survey%20Analysis%20Dashboard.PNG)

![Data Professional Survey Results Analysis Dashboard - Accessible](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/4%20-%20Data%20Professionals%20Survey%20Results%20Analysis/Data%20Professional%20Survey%20Results%20Analysis%20(Accessible).PNG)

Additionally, you can find a copy of the PowerBI file for the regular version of the dashboard [HERE](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/4%20-%20Data%20Professionals%20Survey%20Results%20Analysis/Data%20Professionals%20Survey%20Analysis.pbix), and a copy of the accessible version [HERE](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/4%20-%20Data%20Professionals%20Survey%20Results%20Analysis/Data%20Professionals%20Survey%20Analysis%20(Accessible%20Version).pbix)

