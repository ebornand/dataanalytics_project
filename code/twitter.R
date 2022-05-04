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

