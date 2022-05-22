languages_groups <- c("en", "ge", "ru", "uk", "es", "pt", "fr", "ar", "id", "ko")

data_weighted_countries <- list()
for (l in languages_groups) {
  countries_by_language <- countries_capitals_and_more[countries_capitals_and_more$language == l, ]
  language_trade <- sum(as.numeric(countries_capitals_trade[countries_capitals_trade$language == l, ]$exports)) + 
                    sum(as.numeric(countries_capitals_trade[countries_capitals_trade$language == l, ]$imports))
  language_twitter_users <- sum(countries_twitter_users[countries_twitter_users$language == l, ]$users)
  language_distance <- sum(countries_distances[countries_distances$language == l, ]$distance)
  for (i in 1:nrow(countries_by_language)) {
    if(nrow(countries_capitals_trade[countries_capitals_trade$country == countries_by_language[i, "country", ], ]) > 0 && 
       nrow(countries_distances[countries_distances$country == countries_by_language[i, "country", ], ]) > 0 &&
       nrow(countries_twitter_users[countries_twitter_users$country == countries_by_language[i, "country", ], ]) > 0) {
       country <- data.frame(language = countries_by_language[i, "language"], 
                            country = countries_by_language[i, "country"], 
                            iso2 = countries_by_language[i, "iso2"], 
                            capital = countries_by_language[i, "capital"],
                            trade = (as.numeric(countries_capitals_trade[countries_capitals_trade$country == countries_by_language[i, "country", ], ]$exports) +
                                    as.numeric(countries_capitals_trade[countries_capitals_trade$country == countries_by_language[i, "country", ], ]$imports)),
                            users = countries_twitter_users[countries_twitter_users$country == countries_by_language[i, "country", ], ]$users, 
                            distance = countries_distances[countries_distances$country == countries_by_language[i, "country", ], ]$distance,
                            twitter_weight = 0)
      
      twitter_weight <- 1/as.numeric(language_twitter_users)*as.numeric(country$users)
      country$twitter_weight <- twitter_weight
      country$trade <- as.numeric(country$trade)*twitter_weight
      country$distance <- as.numeric(country$distance)*twitter_weight
      data_weighted_countries[[length(data_weighted_countries)+1]] <- country
    }
  }
}

countries_weighted <- do.call(rbind, data_weighted_countries)
countries_weighted <- distinct(countries_weighted, countries_weighted$language, countries_weighted$country, .keep_all = TRUE)
