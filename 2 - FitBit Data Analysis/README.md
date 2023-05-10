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

## Insights
In all honesty I did not actually start this project with the intent to generate insights. When I began this fitness journey in January I had not put much thought or planning into how the data would be generated or even what data would be generated, so the analysis was largely dependent on the fields that were part of the exported data. Still, as I am quickly learning throughout these projects there are always insights that can be derived from data, as long as you have some data that are relevant to each other. 

With that being said I will summarize my individual findings below:
- As the months progressed, I began racking up far more "fat burn" heartrate zone minutes than "cardio" heartrate zone minutes. This coincides with my change in VR application choices, as I eventually shifted to lower intensity games for ease of use and longevity of workout sessions. This demonstrates that VR applications do indeed have vastly different intensity levels, and users should choose applications that coincide with their preferred calories burning rate.
- According to my manually recorded weights, I lost the most weight in March (roughly 4.2 lbs. over the course of the month). This coincides with the month I had the most total active heart rate minutes. In conjunction with the fact that I did not change my diet at all for this project, this shows that FitBit's active heartrate zone tracking is a good indicator of calorie burn. In addition, as there are other months that have roughly the same amount of total active heartrate minutes but a smaller spread of minutes between cardio and fat burn minutes, this could indicate that VR users who are interested in losing weight specifically should aim to have a good mix of both types of heartrate zones for maximum effectiveness. 
- In general, I was most active in the middle of the week (with Wednesday being my most active day). on the opposite end of the spectrum Saturday was my least active day throughout this project. If I wanted to further increase my calorie burn Saturday would be the best day to look at for improvement of workout longevity and frequency, without giving up too much of my busy schedule.
- Interestingly, there was a slight positive correlation between my restlessness at night and the passage of time till my graduation. I thought this may be a good think to look at as I did in general feel more stressed throughout the days as I got closer to the end of the semester due to increasing workloads Exams. However, the coefficient of determination is rather low (roughly 0.09), meaning that in general this model does not account for much of the variability present between the two variables (my nighttime restlessness score, and the passage of time). Overall, this does not provide anything conclusive but it could be a useful starting point if I wanted to do further research into the cause of nighttime restlessness in my specific case. 
- According to my FitBit I got the best night's sleep (based on deep sleep minutes, which factor heavily into overall sleep score) at the beginning and end of the work week, Monday and Friday, respectively. At least in my case this seems to contradict the idea that a good night's sleep leads to a better workout as this data conflicts with the total workout minutes per weekday. This also tells me that if I want to focus on increasing and stabilizing my overall sleep scores, I should focus on getting more/better rest in the middle of the week. 
- Finally, in general I did get poorer sleep performance as I got closer to graduation, with my monthly overall average sleep score slowly dropping from ~86 to ~84 between January and May. This was very likely due to stress and increasing nighttime restlessness as I discovered earlier in the analysis. Finding the source of this restlessness would help tremendously with increasing my sleep score, although my average score for every month was above the typical scoring range of 72-83 per FitBit's website.

## What Would I Change?
This is a somewhat interesting section I have decided to add to my projects moving forward based on the recommendation of some peers to aid with the learning process. In general, there are a lot of things I would do differently if I were to do this project over again. As I said earlier I did not plan very well for this, and the original intention was simply to practice dashboarding skills in Excel, which overall I think was a success. Still, there was a lot of data that I had the potential to use, but it required extra work in the form of manual entries such as stress, mood scores, etc. Additionally, I think the project would have a lot more potential if it had a stricter focus on the VR aspect. Perhaps I could use the data generated by my fitbit to find the best VR games to workout with, or to find out if VR gaming affected mood/sleep/etc. This would require a lot more upfront planning but would lead to far more interesting results with the potential to provide useable insights for others. 
