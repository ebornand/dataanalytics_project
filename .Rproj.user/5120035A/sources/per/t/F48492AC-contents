
function.createHedonDataFrame <- function (json) {
  # data_json contains two lists: meta and objects. we need to convert the objects-list into a nice dataframe
  # we need to loop through the objects list. each element in data_json$objects contains another list with all the data for one day
  # we create a vector for each variable
  date <- c()
  frequency <- c()
  happiness <- c()
  timeseries <- c()
  # we loop through each element in data_json$objects and sort the parameters into their respective vector
  for (i in json$objects) {
    date <- append(date, as.Date(i$date))
    frequency <- append(frequency, i$frequency)
    happiness <- append(happiness, as.double(i$happiness))
    timeseries <- append(timeseries, i$timeseries)
  }
  #creating the english language data frame
  data <- data.frame(date = date, frequency = frequency, happiness = happiness, timeseries = timeseries)
  return(data)
}