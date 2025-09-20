# Exponential Smoothing on Atlanta Temperatures

## 📌 Overview
This project applies **exponential smoothing** to 20 years of daily high temperature data (July–October, Atlanta).  
The goal is to evaluate whether the “unofficial end of summer” has shifted later over time.

## 🛠️ Tools & Methods
- **Language:** R  
- **Techniques:** Exponential Smoothing (Holt-Winters), CUSUM analysis  
- **Libraries:** stats, zoo, ggplot2  

## 📊 Key Results
- Raw time series data shows seasonal fluctuations across 20 years.  
- Holt-Winters exponential smoothing highlights consistent cooling trends beginning in early August.  
- CUSUM analysis suggested a significant shift around **August 6**, indicating that the unofficial end of summer may begin earlier rather than later.  

### Example Plots
Raw temperatures:  
![Raw Timeseries](results/Raw Temperature Timeseries.png)  

Exponential smoothing (Holt-Winters):  
![Smoothed Temperatures](results/Holt-Winters Filtering (Observed vs Fitted).png)  

## 📚 Course Context
Completed as part of **ISYE 6501: Intro to Analytics Modeling @ Georgia Tech**  
