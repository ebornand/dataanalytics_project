install.packages("rjson")
library("rjson")

df_geocode_kiew <- fromJSON(file = "https://api.myptv.com/geocoding/v1/locations/by-text?searchText=Kiew&apiKey=NTA1NjJmNjQ4MGNkNDc0MmFlM2IzMjJiZGM3ZDI1ZjU6MGM1NzUyZTgtMzE3ZC00Nzg0LWJiODQtMTY5OGJkNzQxYTlj")
df_geocode_berlin <- fromJSON(file = "https://api.myptv.com/geocoding/v1/locations/by-text?searchText=Berlin&apiKey=NTA1NjJmNjQ4MGNkNDc0MmFlM2IzMjJiZGM3ZDI1ZjU6MGM1NzUyZTgtMzE3ZC00Nzg0LWJiODQtMTY5OGJkNzQxYTlj")
coordinates_kiew <- c(df_geocode_kiew$locations[[1]]$referencePosition$latitude, df_geocode_kiew$locations[[1]]$referencePosition$longitude)
coordinates_berlin <- c(df_geocode_berlin$locations[[1]]$referencePosition$latitude, df_geocode_berlin$locations[[1]]$referencePosition$longitude)

url_test <- capture.output(cat('https://api.distancematrix.ai/maps/api/distancematrix/json?origins=',coordinates_kiew[1],',',coordinates_kiew[2],'&destinations=',coordinates_berlin[1],',',coordinates_berlin[2],'&key=PLYEuZwg3IgiJPUOvpIS91prJ7jLB', sep = ""))
df_distance <- fromJSON(file = url_test)

