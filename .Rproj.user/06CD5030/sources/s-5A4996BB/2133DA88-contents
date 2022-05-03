install.packages("rjson")
library("rjson")
source("code/JSON_handler.R")

de_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=de_all&date__gte=2022-02-24&limit=1000")
de_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=en_all&date__gte=2022-01-24&limit=31")

data_de_habit <- function.createHedonDataFrame(de_habit_json)
data_de_base <- function.createHedonDataFrame(de_base_json)