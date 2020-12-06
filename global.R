library(tidyverse)
library(lubridate)
library(shiny)

monthly_temps <- read.csv("monthly_global_land_and_ocean_temperature_anomalies.csv")
monthly_temps <- mutate(monthly_temps, date = ymd(YearMonth, truncated=1))

monthly_temps <- mutate(monthly_temps,
                        year=year(date),
                        month=month(date,label=TRUE)
)

monthly_temps <- rename(monthly_temps, temperature_anomaly = Value)
monthly_temps <- select(monthly_temps, -YearMonth)

