# library setup ----
library(dplyr)
library(data.table)
library(lubridate)
library(stringr)
library(readxl)
library(writexl)
library(clipr)
library(dlookr)
library(echarts4r)

# route ----
getwd()
setwd("C:/Users/jisu0/바탕 화면/공모전/경상북도개발공사_인포그래픽")

# read ----
young_list <- fread("경상북도개발공사_청년 매입임대주택 목록_test_20230825.csv") %>% 
  as_tibble()

# ----

young_list %>% group_by(주택유형) %>% summarise(n=n()) %>% 
  e_charts(주택유형)  %>% e_pie(n,legend = FALSE,labels= list(position = 'outside',formatter=("{d}")))


young_list %>% count(주택유형)  %>% 
  e_charts(주택유형)  %>% e_pie(n,legend = FALSE,labels= list(position = 'outside',formatter=("{c}{d}")))
