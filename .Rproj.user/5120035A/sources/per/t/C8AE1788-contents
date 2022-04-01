# the hedonometer api delivers a json file, we will need the package rjson for dealing with the dataset
install.packages("rjson")
library("rjson")

# for now we use the json file in data/hedonometer.json$
# in the future we could stream the data directly from the hedonometer api
# since we probabbly won't need the latest data we could save the relevant data in the project

data_json <- fromJSON(file = "data/hedonometer.json")

# data_json contains two lists: meta and objects. we need to convert the objects-list into a nice dataframe
# we need to loop through the objects list. each element in data_json$objects contains another list with all the data for one day
# we create a vector for each variable
date <- c()
frequency <- c()
happiness <- c()
timeseries <- c()
# we loop through each element in data_json$objects and sort the parameters into their respective vector
for (i in data_json$objects) {
  date <- append(date, i$date)
  frequency <- append(frequency, i$frequency)
  happiness <- append(happiness, i$happiness)
  timeseries <- append(timeseries, i$timeseries)
}

# we now can create a clean dataframe with our sorted vectors, fabulous :)
data <- data.frame(date = date, frequency = frequency, happiness = happiness, timeseries = timeseries)

# as we can see, the latest entry is from 19.03.2020 -.-, we need to take a closer look at the hedonometer api to get the latest data
data
