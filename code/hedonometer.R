install.packages("rjson")
library("rjson")
source("code/JSON_handler.R")

languages_iso2 <- c("en", "de", "ru", "uk", "es", "pt", "fr", "ar", "id", "ko")
data_hedon_total <- list()
for (l in languages_iso2) {
  habit_json_data <- fromJSON(file = capture.output(cat("http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=", 
                                                       l, "_all&date__gte=2022-02-24&limit=1000", sep = "")))
  base_json_data <- fromJSON(file = capture.output(cat("http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=", 
                                                       l, "_all&date__gte=2022-01-24&limit=31", sep = "")))
  base_data <- function.createHedonDataFrame(base_json_data)
  habit_data <- function.createHedonDataFrame(habit_json_data)
  data_hedon_total[[length(data_hedon_total)+1]] <- list(l, base_data, habit_data)
}

#creating final data frame
data_language <- c()
data_baseline_mean <- c()
data_baseline_sd <- c()
data_reactivity <- c()
data_habituation <- c()

for (d in data_hedon_total) {
  language <- d[[1]]
  base <- d[[2]]
  habit <- d[[3]]
  data_language <- append(data_language, language)
  data_baseline_mean <- append(data_baseline_mean, mean(base$happiness))
  data_baseline_sd <- append(data_baseline_sd, sd(base$happiness))
  data_reactivity <- append(data_reactivity, (mean(base$happiness) - habit$happiness[1]))
  data_habituation <-append(data_habituation, coef(lm(habit$happiness ~ habit$date, data = habit))[2])
}

hedonometer_data <- data.frame(language = data_language, baseline_mean = data_baseline_mean, baseline_sd = data_baseline_sd, reactivity = data_reactivity, habituation = data_habituation)
