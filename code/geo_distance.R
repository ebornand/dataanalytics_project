install.packages("rjson")
install.packages("httr")
install.packages("geosphere")
library("rjson")
library("httr")
library("geosphere")

df_geocode_kiew <- fromJSON(file = "https://api.myptv.com/geocoding/v1/locations/by-text?searchText=Kiew&apiKey=NTA1NjJmNjQ4MGNkNDc0MmFlM2IzMjJiZGM3ZDI1ZjU6MGM1NzUyZTgtMzE3ZC00Nzg0LWJiODQtMTY5OGJkNzQxYTlj")
coordinates_kiew <- c(df_geocode_kiew$locations[[1]]$referencePosition$latitude, df_geocode_kiew$locations[[1]]$referencePosition$longitude)

url_test <- capture.output(cat('https://api.distancematrix.ai/maps/api/distancematrix/json?origins=',coordinates_kiew[1],',',coordinates_kiew[2],'&destinations=',coordinates_berlin[1],',',coordinates_berlin[2],'&key=PLYEuZwg3IgiJPUOvpIS91prJ7jLB', sep = ""))
df_distance <- fromJSON(file = url_test)
url <- "https://distance-calculator.p.rapidapi.com/distance/simple"

data_distancelist <- list()

for (i in 1:nrow(countries_capitals_and_more)) {
  country <- data.frame(language = countries_capitals_and_more[i, "language"], 
                        country = countries_capitals_and_more[i, "country"], 
                        iso2 = countries_capitals_and_more[i, "iso2"], 
                        capital = countries_capitals_and_more[i, "capital"])
  print(country$capital)
  url <- capture.output(cat("https://api.myptv.com/geocoding/v1/locations/by-text?searchText=",
                            country$capital,
                            "&apiKey=NTA1NjJmNjQ4MGNkNDc0MmFlM2IzMjJiZGM3ZDI1ZjU6MGM1NzUyZTgtMzE3ZC00Nzg0LWJiODQtMTY5OGJkNzQxYTlj", 
                            sep = ""))
  print(url)
  geocode_country <- fromJSON(file = url)
  coordinates_capital <- c(geocode_country$locations[[1]]$referencePosition$latitude, geocode_country$locations[[1]]$referencePosition$longitude)
  print(i)
  distance <- distm(c(as.numeric(coordinates_kiew[1]), as.numeric(coordinates_kiew[2])), c(as.numeric(coordinates_capital[1]), as.numeric(coordinates_capital[2])), fun = distHaversine)
  data_distancelist[[length(data_distancelist)+1]] <- data.frame(language = country$language, 
                                                                 country = country$country, 
                                                                 distance = distance)
}
countries_distances <- do.call(rbind, data_distancelist)

old <- function() {
  distance_url <- capture.output(cat('https://api.distancematrix.ai/maps/api/distancematrix/json?origins=',
                                     coordinates_kiew[1],',',coordinates_kiew[2],
                                     '&destinations=',coordinates_capital[1],',',coordinates_capital[2],
                                     '&key=PLYEuZwg3IgiJPUOvpIS91prJ7jLB', sep = ""))
}