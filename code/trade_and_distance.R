languages_groups <- c("en", "ge", "ru", "uk", "es", "pt", "fr", "ar", "id", "ko")
data_language_groups <- list()
for (l in languages_groups) {
  data_language_groups[[length(data_language_groups)+1]] <- data.frame(language = l,
                                                                       distance = sum(countries_weighted[countries_weighted$language == l, ]$distance),
                                                                       trade = sum(countries_weighted[countries_weighted$language == l, ]$trade))
}
final_language_table <- do.call(rbind, data_language_groups)
