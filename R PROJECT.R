getwd()
#covid_19_india.csv
#to load data from covid_19_india csv file
df=read.csv("covid_19_india.csv")

#to show first 6 records
head(df)

#to check the number of rows and columns
dim(df)

#Structure of the dataset
str(df) 

#Summary statistics of the dataset
summary(df)

#to show those records whose State.UnionTerritory ='Delhi'
#use inbuilt function filter() which define in dplyr library
#first time install dplyr library
library(dplyr)
filter(df,State.UnionTerritory=='Delhi')

#to show State.UnionTerritory and Deaths of those records whose State.UnionTerritory ='Delhi'
#use pipe operator
df %>% select(Deaths,State.UnionTerritory) %>%filter(State.UnionTerritory=='Delhi')

#to show all column name
colnames(df)

#to show all rows of those columns whose column name start with 'C'
#but only first 6 records,use inbuilt function starts_with()
df %>% select(starts_with('C'))%>% head()

#to show all rows of those columns whose column name ends with 'd'
#but only first 6 records,use inbuilt function ends_with()
df %>% select(ends_with('d'))%>% head()

#to change the position of particular column
df %>%select(Deaths,everything())%>%head()
head(df)

#change the column's order with relocate()
df%>%relocate(State.UnionTerritory:Confirmed, .before=Date)%>%head()

#group_by()
#to count the no.ConfirmedIndianNational  according to State.UnionTerritory
df%>%group_by(State.UnionTerritory)%>%summarize(n())

#to show the State.UnionTerritory wise total deaths,average
df%>%group_by(State.UnionTerritory)%>%summarize(State.UnionTerritory=n(),Total_deaths=sum(Deaths),Average_deaths=mean(Deaths))

#visualisation:ggplot():grammer of graphics or plotly() inbuilt library
#ggplot2:inbuilt package:first time install on your system
#install.packages("ggplot2")
#call library
library("ggplot2")

#use ggplot() inbuilt function of ggplot2 library
#step 1
ggplot(df)

#step2
#to define axis of X axis and Y axis
#in X-axis ,take input area
#in y axis ,take output price
ggplot(df,aes(x=Deaths,y=State.UnionTerritory))
#aes() inbuilt function:aesthetic #in python sb.scatterplot(data=df,x=area,y=price)

#step 3
#create scatter plot :geom_point() inbuilt function
ggplot(df,aes(x=Deaths,y=State.UnionTerritory))+geom_point()

#positive correlation
#to change the color  of datapoint 
ggplot(df,aes(x=Deaths,y=State.UnionTerritory))+geom_point(color='red')

#to define the titles and subtitles of graph
ggplot(df,aes(x=Deaths,y=State.UnionTerritory))+geom_point(color='red')+labs(title="COVID 19",subtitle="State.UnionTerritory WISE Deaths")

#line and scatterplot both on same graph
ggplot(df,aes(x=Deaths,y=State.UnionTerritory))+geom_point(color='red')+geom_line(color="blue")

#histogram():it is also a frequency graph
#it is used for contineous numeric data
#histogram():geom_histogram
ggplot(df,aes(x=Confirmed))+geom_histogram()
ggplot(df,aes(x=Confirmed))+geom_histogram(fill="red",color="blue") #color-to change border color

#bar():frequency graph
ggplot(df,aes(x=ConfirmedIndianNational))+geom_bar(fill="red",color="blue")

#boxplot:to check the outlier
#to check outlier
ggplot(data=df,aes(x=Deaths,y=State.UnionTerritory))+geom_boxplot()

