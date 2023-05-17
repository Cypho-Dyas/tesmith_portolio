# Analysis of GoodReads Database for Reading Recommendations

## Skills Displayed
- Data Exctration/Transforming/Loading
- Data Cleaning (Power Query)
- Data Visualizatoin (Power BI)

## Reasoning
I selected this project based on my passion for reading, as it is one of my favorite pastimes. Having experienced the challenge of discovering a captivating book, I was motivated to leverage my data analysis skills to assist others in finding their next page-turner. Moreover, I recognized an opportunity to demonstrate my proficiency in Power BI, a visualization tool that has rapidly become my personal favorite. By tackling this project, I aimed to tackle a real-world problem while simultaneously showcasing my expertise in this visualization tool.

## The Data
The dataset was retrieved from a user on Kaggle who scraped the data entirely from the Goodreads API - [Link to Original Dataset](https://www.kaggle.com/datasets/jealousleopard/goodreadsbooks)

The dataset itself contains information on over 11,000 unique publications available through Good Reads. These publications include everything from single page press releases to full-fledged novels dating back to the early 1900s. 

Some examples of the columns present in the data include the following:

- bookID
- title
- authors
- average_rating
- isbn
- language_code
- ratings_count
- publication_date
- publisher

## Data Cleaning
I began the data cleaning process by considering the data and planning a rough draft of my final visualization. Once I had a rough idea of what information would most benefit my stakeholders reading decision given the available data. I downloaded a copy of the data in .csv format and subsequently loaded it directly into Microsoft Power BI for transformation. 

You can find a copy of the .csv file [HERE](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/3%20-%20Reading%20Recomendations%20Dashboard/books.csv). 

The data was remarkably dirty given the final visualization I had in mind. Some of the data cleaning steps taken included the following, all done in Power BI before finally loading the data to create my viz:

- Renamed all columns for readability and conciseness using proper case (from the original snake case)
- Changed some data formats to better reflect the data being presented and to ensure that all created measures would function appropriately
- Deleted unnecessary columns
- Used find and replace to change all language codes to the full language name
- Split the authors column to show primary author (listed first in the case of multiple authors) and secondary authors (all others listed after the primary) in their own columns
- Trimmed all columns to remove empty entries on both sides
- Used find and replace for similar entries to ensure that they were all written the same way and would appear together when grouped for the visualization
- Filtered the dataset to included only relevant data (strange or incorrect dates and publications with less than 150 pages were filtered out to ensure that the final dataset pertained specifically to readers who are looking for a novel to invest their time into

This actually turned out to be the most arduous data cleaning task I have undertaken so far, as many of the author names and publisher names had been entered differently or (in some cases) incorrectly altogether. I knew going into this process that I would want to group these two fields categorically at some point in my viz, so I had to ensure that all of these similar entries were written exactly the same throughout each field. Throughout this process I came to really understand the patience required to properly clean a set of data for use. Fixing the publishers field itself required over 600 find and replace functions, with independent research needed continuously to ensure that the new values were correct and assigned to the appropriate titles. The entire process took multiple days of focused attention before I was satisfied with the result.

## Data Analysis and Visualization
The cleaned data was loaded into Power Bi as a single table for visualization. You can see the final result below


