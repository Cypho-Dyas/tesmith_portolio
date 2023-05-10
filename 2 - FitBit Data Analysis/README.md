# FitBit Data Analysis Project

## Skills Dispayed 
- Data Wrangling
- Data Cleaning (using Excel Power Query & Core Functions)
- Pivot Tables 
- Data Visualization Using Excel Charts

## Reasoning
This project was something I decided to do just prior to beginning the final semester of my undergraduate degree, in January of 2023. At that time, I knew that my graduation would be coming up in just a few short months and I wanted to try and get into the best possible shape beforehand as my lifestyle had become quite sedentary due to studying/working from home full time. My goal was to lose as much weight as possible in that timeframe using VR technology which was readily available to me and offered a quick, simple way to work out every day that I  could fit into my busy schedule. I had been studying data analysis for a couple of months already at this point and thought that this journey might make an interesting project for this portfolio. I was also partially inspired by a data analyst project I had found where someone tracked and subsequently visualized their progress towards training for a marathon shortly after being diagnosed with cancer. This would be the first time I had seen someone use personal health-related data to make a project and I wanted to see what insights I could derive from my own journey.

## The Data
The data was collected entirely from my FitBit (Model: Inspire 2) and its associated mobile software application. With the exception of my weight, which was manually recorded in the mobile app once a week for a four month period, all of the data was passively collected by my FitBit, which was worn at all times other than when bathing/showering. At the end of the four month period the data was requested and subsequently exported from FitBit's website as a series of files in .CSV format. Each file corresponded to a month (January-May) and a data type (physical activity, sleep, temperature, etc.). In total, 11 separate .CSV files were extracted to a folder used to track the project: 5 physical activity files (one for each month), 5 temperature files (one for each month), and 1 file that contained sleep scores for all five months collectively.

Examples of some of the fields contained within the .CSV files are shown below:

### Physical Activity
- date_time
- heart_zone
- total_minutes
### Computed Temperature
- sleep_start
- sleep_end
- temperature_samples
- nightly_temperature
### Sleep Scores
- sleep_log_entry_id
- overall_score
- revitilization_score
- deep_sleep_in_minutes

## Data Cleaning
The .CSV files were pulled into a Microsoft Excel workbook and transformed using Power Query before loading them into a single "raw data" sheet that was used to construct the pivot tables and subsequent visualizations. Each of the corresponding .CSV files (Jan-May of Physical Activity, and Jan-May of temperature) were appended to each other to create one cohesive table that contained all of the data in order observation datetime. For readability's sake, the column names were changed from snake case to title case, and unnecessary or null fields were removed entirely. All datetime fields were split into two separate fields: a date field and a time field to assist with summarization while leaving data intact for future analysis. As the data contained rows considered extraneous to the project (I wanted the project to be based on exactly 4 calendar months of data, however FitBit only allows export of either the last 30 days of data or your accounts lifetime data, which in my case contained additional days from years prior) , they were filtered for and removed. Finally, text data was trimmed on both sides to ensure consistency throughout and some observations were renamed for readability and comprehension.

## Data Analysis and Visualization
A new Excel sheet was created to house the pivot tables used to analyze the data from each section of the raw data and to generate pivot charts for each interesting insight that was discovered in the process. The final visualizations were then combined into a dashboard with splicers that would let you change the month/date for relevant charts to generate additional insights that may not be readily visible from the high-level view that the stock dashboard provides.   

The finished dashboard is shown below, along with a link to the final Excel workbook:

![Final FitBit Data Analysis Dashboard](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/2%20-%20FitBit%20Data%20Analysis/Picture%20of%20Final%20Dashboard.PNG)

[Link to Raw Excel Workbook](https://github.com/Cypho-Dyas/tesmith_portolio_projects/blob/main/2%20-%20FitBit%20Data%20Analysis/FitBit%20Final%20Semester%20Health%20Analysis%20Project.xlsx)
