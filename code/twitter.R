# names of countries in iso2
# users in millions
twitter_least_user_measure <- 4.3
twitter_users <- c(76.9, 58.95, 23.6, 19.05, 18.45, 18.4, 
                   16.1, 14.1, 13.9, 11.45, 10.5, 10, 
                   8.75, 7.9, 7.75, 7.2, 5.9, 5.15, 
                   4.4, 4.3)
twitter_countries <- c("US", "JP", "IN", "BR", "ID", 
                       "GB", "TR", "SA", "MX", "TH", 
                       "PH", "FR", "ES", "CA", "DE", 
                       "KR", "AR", "EG", "MY", "CO")

twitter_data <- data.frame(twitter_countries, twitter_users, stringsAsFactors = FALSE)

data_twitter_users <- list()

for (i in 1:nrow(countries_capitals_and_more)) {
  country <- data.frame(language = countries_capitals_and_more[i, "language"], 
                        country = countries_capitals_and_more[i, "country"], 
                        iso2 = countries_capitals_and_more[i, "iso2"], 
                        capital = countries_capitals_and_more[i, "capital"])
  users <- 4.3
  for (x in 1:length(twitter_countries)) {
    if(twitter_countries[x] == country$iso2) {
      users <- twitter_users[x]
      print(twitter_users[x])
    }
  }
  data_twitter_users[[length(data_twitter_users)+1]] <- data.frame(language = country$language, 
                                                                 country = country$country, 
                                                                 users = users)
}

countries_twitter_users <- do.call(rbind, data_twitter_users)
