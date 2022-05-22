for (i in 1:nrow(countries_capitals_trade)) {
  countries_capitals_trade[i, "exports"] <- format(round(as.numeric(countries_capitals_trade[i, "exports"]), 3), nsmall = 3)
  countries_capitals_trade[i, "imports"] <- format(round(as.numeric(countries_capitals_trade[i, "imports"]), 3), nsmall = 3)
}
