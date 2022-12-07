##My extremely messy data wrangling script 
setwd("~/Desktop")
library(readxl)
library(writexl)
data<- read_xlsx("Mag6PlusEarthquakes_1900-2013.xlsx")
data$time
data$substring_time = substr(data$time,1,4)

data<- read_xlsx("Clean.xlsx")
clean<- read_xlsx("CleanQuakes.xlsx")

data$substring_time = substr(data$time,1,4)
clean$substring_time = substr(clean$time,1,4)

data <- data[,-27:-57]

NorthA<-data[data$NorthA=='North America',]
South<-data[data$SouthA=='South America',]

Asia<-data[data$Asia=='Asia',]
Europe<-data[data$SouthA=='Europe',]

Ant<-data[data$Antartica=='Antartica',]

library(tidyverse)
#Oceania
NorthA<-data %>% filter(Africa == "Africa" | Africa2.0 == "Africa")
NorthA<-data %>% filter(Oceania == "Oceania" | Oceania2.0 == "Oceania" | Oceania3.0 == "Oceania")
NorthA<-data %>% filter(Continents == "South America")

SouthA<-final_data %>% filter(Continents == "South America")

write_xlsx(SouthA,"SA.xlsx")
write_xlsx(SouthA,"SouthAmerica.xlsx")
write_xlsx(Africa,"Africa.xlsx")
write_xlsx(Europe,"Europe.xlsx")
write_xlsx(Oceania,"Oceania.xlsx")

df[df$gender=='North America', ]


colnames(complete_data)[17]<-"NorthA"
colnames(complete_data)[16]<-"SouthA"
colnames(data)[23]<-"Oceania2.0"
colnames(data)[24]<-"Oceania3.0"

NorthA_data <- complete_data[complete_data$NorthA == "North America",]

df<-na.omit(complete_data$NorthA)

df<-as.data.frame(df)

data<-data[-8317:-1048575,]

#if time includes
##filter based on decade
x <- data[data$substring_time == "1900" | data$substring_time == "1901" | data$substring_time == "1902" | data$substring_time == "1903"|
                          data$substring_time == "1904" | data$substring_time == "1905" | data$substring_time == "1906" | data$substring_time == "1907"|
                          data$substring_time == "1908" | data$substring_time == "1909",]

x$decade<-"1900"

z<-data[data$substring_time == "1910" | data$substring_time == "1911" | data$substring_time == "1912" | data$substring_time == "1913"|
            data$substring_time == "1914" | data$substring_time == "1915" | data$substring_time == "1916" | data$substring_time == "1917"|
            data$substring_time == "1918" | data$substring_time == "1919",]

z$decade<-"1910"


y <- data[data$substring_time == "1920" | data$substring_time == "1921" | data$substring_time == "1922" | data$substring_time == "1923"|
              data$substring_time == "1924" | data$substring_time == "1925" | data$substring_time == "1926" | data$substring_time == "1927"|
              data$substring_time == "1928" | data$substring_time == "1929",]

y$decade<-"1920"

a<-data[data$substring_time == "1930" | data$substring_time == "1931" | data$substring_time == "1932" | data$substring_time == "1933"|
            data$substring_time == "1934" | data$substring_time == "1935" | data$substring_time == "1936" | data$substring_time == "1937"|
            data$substring_time == "1938" | data$substring_time == "1939",]

a$decade<-"1930"

b<-data[data$substring_time == "1940" | data$substring_time == "1941" | data$substring_time == "1942" | data$substring_time == "1943"|
            data$substring_time == "1944" | data$substring_time == "1945" | data$substring_time == "1946" | data$substring_time == "1947"|
            data$substring_time == "1948" | data$substring_time == "1949",]

b$decade<-"1940"

c<-data[data$substring_time == "1950" | data$substring_time == "1951" | data$substring_time == "1952" | data$substring_time == "1953"|
            data$substring_time == "1954" | data$substring_time == "1955" | data$substring_time == "1956" | data$substring_time == "1957"|
            data$substring_time == "1958" | data$substring_time == "1959",]

c$decade<-"1950"

d<-data[data$substring_time == "1960" | data$substring_time == "1961" | data$substring_time == "1962" | data$substring_time == "1963"|
            data$substring_time == "1964" | data$substring_time == "1965" | data$substring_time == "1966" | data$substring_time == "1967"|
            data$substring_time == "1968" | data$substring_time == "1969",]

d$decade<-"1960"

e<-data[data$substring_time == "1970" | data$substring_time == "1971" | data$substring_time == "1972" | data$substring_time == "1973"|
            data$substring_time == "1974" | data$substring_time == "1975" | data$substring_time == "1976" | data$substring_time == "1977"|
            data$substring_time == "1978" | data$substring_time == "1979",]

e$decade<-"1970"

f<-data[data$substring_time == "1980" | data$substring_time == "1981" | data$substring_time == "1982" | data$substring_time == "1983"|
            data$substring_time == "1984" | data$substring_time == "1985" | data$substring_time == "1986" | data$substring_time == "1987"|
            data$substring_time == "1988" | data$substring_time == "1989",]

f$decade<-"1980"

g<-data[data$substring_time == "1990" | data$substring_time == "1991" | data$substring_time == "1992" | data$substring_time == "1993"|
            data$substring_time == "1994" | data$substring_time == "1995" | data$substring_time == "1996" | data$substring_time == "1997"|
            data$substring_time == "1998" | data$substring_time == "1999",]

g$decade<-"1990"

h<-data[data$substring_time == "2000" | data$substring_time == "2001" | data$substring_time == "2002" | data$substring_time == "2003"|
            data$substring_time == "2004" | data$substring_time == "2005" | data$substring_time == "2006" | data$substring_time == "2007"|
            data$substring_time == "2008" | data$substring_time == "2009",]

h$decade<-"2000"

##merge!!
#put all data frames into list
df_list <- list(x,z,y,a,b,c,d,e,f,g,h)

#merge all data frames in list
MERGED_data<-Reduce(function(x, y) merge(x, y, all=TRUE), df_list)

write_xlsx(MERGED_data,"MERGED_final.xlsx")

subset_NorthA <- NorthA[NorthA$substring_time == "1900" | NorthA$substring_time == "1901" | NorthA$substring_time == "1902" | NorthA$substring_time == "1903"|
                          NorthA$substring_time == "1904" | NorthA$substring_time == "1905" | NorthA$substring_time == "1906" | NorthA$substring_time == "1907"|
                          NorthA$substring_time == "1908" | NorthA$substring_time == "1909",]

subset_NorthA <- NorthA[NorthA$substring_time == "1910" | NorthA$substring_time == "1911" | NorthA$substring_time == "1912" | NorthA$substring_time == "1913"|
                          NorthA$substring_time == "1914" | NorthA$substring_time == "1915" | NorthA$substring_time == "1916" | NorthA$substring_time == "1917"|
                          NorthA$substring_time == "1918" | NorthA$substring_time == "1919",]

subset_NorthA <- NorthA[NorthA$substring_time == "1920" | NorthA$substring_time == "1921" | NorthA$substring_time == "1922" | NorthA$substring_time == "1923"|
                          NorthA$substring_time == "1924" | NorthA$substring_time == "1925" | NorthA$substring_time == "1926" | NorthA$substring_time == "1927"|
                          NorthA$substring_time == "1928" | NorthA$substring_time == "1929",]

subset_NorthA <- NorthA[NorthA$substring_time == "1930" | NorthA$substring_time == "1931" | NorthA$substring_time == "1932" | NorthA$substring_time == "1933"|
                          NorthA$substring_time == "1934" | NorthA$substring_time == "1935" | NorthA$substring_time == "1936" | NorthA$substring_time == "1937"|
                          NorthA$substring_time == "1938" | NorthA$substring_time == "1939",]

subset_NorthA <- NorthA[NorthA$substring_time == "1940" | NorthA$substring_time == "1941" | NorthA$substring_time == "1942" | NorthA$substring_time == "1943"|
                          NorthA$substring_time == "1944" | NorthA$substring_time == "1945" | NorthA$substring_time == "1946" | NorthA$substring_time == "1947"|
                          NorthA$substring_time == "1948" | NorthA$substring_time == "1949",]


subset_NorthA <- NorthA[NorthA$substring_time == "1950" | NorthA$substring_time == "1951" | NorthA$substring_time == "1952" | NorthA$substring_time == "1953"|
                      NorthA$substring_time == "1954" | NorthA$substring_time == "1955" | NorthA$substring_time == "1956" | NorthA$substring_time == "1957"|
                      NorthA$substring_time == "1958" | NorthA$substring_time == "1959",]

subset_NorthA <- NorthA[NorthA$substring_time == "1960" | NorthA$substring_time == "1961" | NorthA$substring_time == "1962" | NorthA$substring_time == "1963"|
                          NorthA$substring_time == "1964" | NorthA$substring_time == "1965" | NorthA$substring_time == "1966" | NorthA$substring_time == "1967"|
                          NorthA$substring_time == "1968" | NorthA$substring_time == "1969",]

subset_NorthA <- NorthA[NorthA$substring_time == "1970" | NorthA$substring_time == "1971" | NorthA$substring_time == "1972" | NorthA$substring_time == "1973"|
                          NorthA$substring_time == "1974" | NorthA$substring_time == "1975" | NorthA$substring_time == "1976" | NorthA$substring_time == "1977"|
                          NorthA$substring_time == "1978" | NorthA$substring_time == "1979",]

subset_NorthA <- NorthA[NorthA$substring_time == "1980" | NorthA$substring_time == "1981" | NorthA$substring_time == "1982" | NorthA$substring_time == "1983"|
                          NorthA$substring_time == "1984" | NorthA$substring_time == "1985" | NorthA$substring_time == "1986" | NorthA$substring_time == "1987"|
                          NorthA$substring_time == "1988" | NorthA$substring_time == "1989",]

subset_NorthA <- NorthA[NorthA$substring_time == "1990" | NorthA$substring_time == "1991" | NorthA$substring_time == "1992" | NorthA$substring_time == "1993"|
                      NorthA$substring_time == "1994" | NorthA$substring_time == "1995" | NorthA$substring_time == "1996" | NorthA$substring_time == "1997"|
                      NorthA$substring_time == "1998" | NorthA$substring_time == "1999",]

subset_NorthA <- NorthA[NorthA$substring_time == "2000" | NorthA$substring_time == "2001" | NorthA$substring_time == "2002" | NorthA$substring_time == "2003"|
                          NorthA$substring_time == "2004" | NorthA$substring_time == "2005" | NorthA$substring_time == "2006" | NorthA$substring_time == "2007"|
                          NorthA$substring_time == "2008" | NorthA$substring_time == "2009",]

data_2010s <- data[data$substring_time == "2010" | data$substring_time == "2011" | data$substring_time == "2012" | data$substring_time == "2013"|
                      data$substring_time == "2014",]
