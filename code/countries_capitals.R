install.packages("rjson")
install.packages("dplyr")
library("dplyr")
library("rjson")

countries_english <- strsplit("Antigua and Barbuda;Barbados;Belize;Botswana;Burundi;Cameroon;Canada;Cape Verde;Dominica;Eritrea;Eswatini;Fiji;Grenada;Guyana;Ireland;Kenya;Kiribati;Lesotho;Liberia;Malawi;Malta;Namibia;New Zealand;Nigeria;Pakistan;Palau;Palestinian State;Papua New Guinea;Philippines;Rwanda;Samoa;Seychelles;Sierra Leone;Singapore;Solomon Islands;South Africa;South Sudan;Sudan;Tanzania;Tonga;Trinidad and Tobago;Tuvalu;Uganda;United Kingdom;United States;Vanuatu;Zambia;Zimbabwe", ";")
countries_german <- strsplit("Austria;Belgium;Germany;Italy;Liechtenstein;Luxembourg;Switzerland", ";")
countries_russian <- strsplit("Belarus;Kazakhstan;Kyrgyzstan;Russia", ";")
countries_spanish <- strsplit("Argentina;Bolivia;Chile;Colombia;Costa Rica;Cuba;Dominican Republic;East Timor;Ecuador;El Salvador;Equatorial Guinea;Guatemala;Honduras;Mexico;Micronesia;Nicaragua;Panama;Paraguay;Peru;Spain;Uruguay;Venezuela", ";")
countries_portuguese <- strsplit("Angola;Brazil;Equatorial Guinea;Guinea-Bissau;Mozambique;Myanmar;Portugal;Democratic Republic of São Tomé and Príncipe", ";")
countries_french <- strsplit("Belgium;Benin;Burkina Faso;Burundi;Cameroon;Canada;Cape Verde;Central African Republic;Chad;Comoros;Democratic Republic of the Congo; Republic of Congo;Côte d’Ivoire;Djibouti;Equatorial Guinea;France;Gabon; Gambia;Guinea; Haiti;Luxembourg;Madagascar;Mali;Monaco;Niger;Rwanda;Senegal;Seychelles;Switzerland;Togo;Vanuatu Chinese", ";")
countries_arabic <- strsplit("Algeria;Bahrain;Chad;Comoros;Djibouti;Egypt;Eritrea;Iraq;Jordan;Kuwait;Lebanon;Libya;Mauritania;Morocco;Oman;Qatar;Saudi Arabia;Somalia;Sudan;Syria;Tunisia;United Arab Emirates;Yemen", ";")
#missing korean, indonesian, ukrainian
countries_korean <- strsplit("South Korea", ";")
countries_indonesian <- strsplit("Indonesia", ";")
countries_ukrainian <- strsplit("Ukraine", ";")

languages <- list(list("en", countries_english[[1]]), 
                  list("ge", countries_german[[1]]), 
                  list("ru", countries_russian[[1]]), 
                  list("es", countries_spanish[[1]]), 
                  list("pt", countries_portuguese[[1]]), 
                  list("fr", countries_french[[1]]), 
                  list("ar", countries_arabic[[1]]), 
                  list("ko", countries_korean[[1]]), 
                  list("id", countries_indonesian[[1]]), 
                  list("uk", countries_ukrainian[[1]]))

countries_capitals_and_more <- data.frame()

#data for countries
countries_data <- fromJSON(file = "https://countriesnow.space/api/v0.1/countries/capital")
countries_data <- countries_data$data

datalist <- list()

for (language in languages) {
  name <- language[[1]]
  countries <- language[[2]]
  for (c in countries) {
    countriesnow_entry <- filterList(countries_data, c)
    if(!is.null(countriesnow_entry)) {
      datalist[[length(datalist)+1]] <- data.frame(language = name, country = countriesnow_entry$name, iso2 = countriesnow_entry$iso2, capital = countriesnow_entry$capital)
    }
  }
}

countries_capitals_and_more <- do.call(rbind, datalist)

filterList <- function (list, name) {
  for (l in list) {
    for (i in l) {
      if(i == name) {
        return(l)
      }
    }
  }
}
