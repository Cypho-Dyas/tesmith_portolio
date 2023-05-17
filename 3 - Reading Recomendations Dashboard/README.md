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
The cleaned data was loaded into Power Bi as a single table for visualization. On the right side I included a slider for the viewer to change the date range for the entire page, along with a gauge to show the average reader rating of the current selection quickly and succinctly (average score from 1 to 5, includes all publications when no filter is applied), the total number of available ratings for the current selection, and the average number of pages for the current selection. 

I have started to realize that I always prefer to add a categorical breakdown when possible in visualizations, to give the viewer a quick breakdown they can subsequently filter on for quick, high-level results. In this case I have used a trusty tree map to show the breakdown of publishers by total count of books published. You can use the drill mode in Power BI to drill down into these publishers to find more breakdowns in the following order, all based on number of books published: publisher -> Authors -> Language -> Titles. 

Of course, any avid reader will want to know what the most read books are, so I have included a bar chart to show the top 15 books based on number of ratings for any selection made on the page. This way stakholders can quickly discover which books are the most popular based on any given publisher/author. They can also see the average ratings of each of these most rated books to make a more informed decision for their next read. Additionally, I included a line and column chart next to that to show the top 5 authors based on the their count of ratings as well. This is intended to help viewers quickly filter for authors who have clearly gotten a lot of attention over their careers from readers. The left Y axis (columns) shows the average rating for each the authors while the right Y axis (line) shows the number of books published by each author. This gives viewers a quick glance at the top authors and how they stack up to each other based on multiple factors.

Below those two charts I included a simple timeline for the count of books published based on the current timeline selection (the default is set to Jan 1, 1970 - Dec 29th,2006). If viewers are interested they can use this timeline to see the trend of published books and where their current selection lies within that trend. 

Finally, I included a fun little linear correlation plot looking at the reader ratings in relation to the number of pages for each publication. I always like to throw in something fun like this for additional insights and to try and keep my statistics lessons from school fresh in my mind. I created a measure to calculate both the correlation coefficient and the coefficient of determination which will update based on any selection made on the dashboard. Just an interesting and fun little chart to give more depth to my analysis. 

Once all of the above steps were finished, I filtered the entire visual to only show data for publishers from the dataset who had published more than 100 books. I did this for two primary reasons: (1) to limit the amount of publishers and data so that the tree map and other visuals were not overwhelming; and (2) to reduce the dataset down to the most popular books/publishers, which would be of more use to my project stakeholders. 

I usually create simple, no-frills dashboards but this time I decided to do a little something extra by adding a background to the dashboard. I wanted the viewers to feel comfortable while viewing the dashboard to put them into a reading mood. For whatever reason lo-fi artwork (especially landscapes) do this for me, so I found a good one under creative commons license to use here. Over all the project may have been a simple one, but I am happy with the final visualization, which you can see below:

![Data Viz Dashboard](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/3%20-%20Reading%20Recomendations%20Dashboard/Reading%20Recommendation%20Dashboard1.PNG)

You can also find a copy of the Power BI file [HERE](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/3%20-%20Reading%20Recomendations%20Dashboard/Reading%20Recommendation%20Dashboard.pbix)

## Insights

- The average book receives a rating close to 4 out of 5 from readers, which remains relatively consistent even when considering different authors, publishers, and time frames. This suggests that readers tend to avoid giving excessively low ratings, potentially due to their attachment to the time invested in the story.
- The dataset includes over 154 million reader ratings, reflecting the applied filters during data cleaning and visualization. Notably, this number is directly correlated with the publisher's size in terms of book count.
- On average, books in the dataset have 381 pages, indicating a slight decrease compared to the 80s. This suggests that authors have been shortening book lengths in recent decades, possibly due to publishers' tighter deadlines driven by increased demand for publications.
- The dataset reveals that the three largest publishers are Penguin, HarperCollins, and Vintage, each surpassing the book count of the next largest publisher, Bantam Books, by more than two-fold.
- Surprisingly, the most reviewed books in the dataset predominantly consist of titles from the early 2000s, rather than older books. Readers seeking captivating reads might want to consider this time period without overly restricting their selection criteria.
- The most rated author in our dataset is Stephen King, comprising approximately 2% of total reviews with over 3 million reader ratings. Orson Scott Card follows closely with 773,000 reader ratings. Although King is not the highest rated author overall (that distinction goes to Mercedes Lackey), his extensive reviews and 20 additional published works make him an excellent starting point for readers seeking their next captivating read.
- The number of books published annually has consistently and significantly increased since the early '90s, reflecting a growing demand for engaging reads each year.
- Overall, there is a strong positive correlation between the average rating and the total number of pages in a book, as observed across the entire dataset. Furthermore, the coefficient of determination indicates that the model explains most of the variation between these variables. While these values may vary when applying filters in visualizations, this correlation generally remains consistent, suggesting that readers tend to avoid giving lower ratings to books they have invested significant time in, preserving the value of their time investment.

## What Would I Change?
Working with this dataset was overall enjoyable, although I did encounter areas where I could have made different choices. Firstly, I would have liked to conduct categorical analysis based on both genre and publisher. Initially, I spent some time searching for an external dataset or table to join with, but unfortunately, I couldn't find a suitable one. As I am currently learning Python, I may explore web scraping in the future to address this. However, due to limited time, I had to proceed with the available data.

Furthermore, it would have been beneficial to include more data on books in different languages to accommodate international stakeholders. While the dataset does include books in multiple languages, English dominates by a significant margin. I faced a decision to either filter the data to English-only or strive to cater to international readers. In hindsight, spreading my analysis across multiple languages yielded underwhelming results. Given the disparity in the available data, it would have been wiser to focus my analysis on the primary language to maximize the impact on stakeholders.
