install.packages("rjson")
install.packages("imfr")
install.packages("dplyr")
library("imfr")
library("rjson")
library("dplyr")

DOT_2021Q1 <- fromJSON(file = "http://dataservices.imf.org/REST/SDMX_JSON.svc/DataStructure/DOT_2021Q1")

#Important indicators for the imf_data function:
#   - TXG_FOB_USD: Goods, Value of Exports, Free on board (FOB), US Dollars
#   - TMG_CIF_USD: Goods, Value of Imports, Cost, Insurance, Freight (CIF), US Dollars
#   - TMG_FOB_USD: Goods, Value of Imports, Free on board (FOB), US Dollars
#   - TBG_USD: Goods, Value of Trade Balance, US Dollars
export_FOB_Ukr <- imf_data(database_id = "DOT", country = "UA", indicator = "TXG_FOB_USD", return_raw = TRUE, times = 3)
import_CIF_Ukr <- imf_data(database_id = "DOT", country = "UA", indicator = "TMG_CIF_USD", return_raw = TRUE, times = 3)
trade_balance_Ukr <- imf_data(database_id = "DOT", country = "UA", indicator = "TBG_USD", return_raw = TRUE, times = 3)

#for segmenting Data => data_df <- data$CompactData$DataSet$Series
# columns for the dataset => names(data_df)
# column @FREQ --> A stands for annually
# column @COUNTERPART_AREA --> Area who receives the exports
# column Obs --> contains the USD values

exports_ukr <- export_FOB_Ukr$CompactData$DataSet$Series
imports_ukr <- import_CIF_Ukr$CompactData$DataSet$Series
tb_ukr <- trade_balance_Ukr$CompactData$DataSet$Series

colnames(exports_ukr) <- c("frequency", "ref_area", "indicator", "counterpart_area", "unit_mult", "time_format", "obs")
colnames(imports_ukr) <- c("frequency", "ref_area", "indicator", "counterpart_area", "unit_mult", "time_format", "obs")
colnames(tb_ukr) <- c("frequency", "ref_area", "indicator", "counterpart_area", "unit_mult", "time_format", "obs")

trade_datalist <- list()

for (i in 1:nrow(countries_capitals_and_more)) {
  country <- data.frame(language = countries_capitals_and_more[i, "language"], 
                        country = countries_capitals_and_more[i, "country"], 
                        iso2 = countries_capitals_and_more[i, "iso2"], 
                        capital = countries_capitals_and_more[i, "capital"])
  
  exports_ukr_x <- filter(exports_ukr, counterpart_area == country$iso2 & frequency == "A")
  imports_ukr_x <- filter(imports_ukr, counterpart_area == country$iso2 & frequency == "A")
  tb_ukr_x <- filter(tb_ukr, counterpart_area == country$iso2 & frequency == "A")
  if(!is.null(exports_ukr_x) && !is.null(imports_ukr_x) && !is.null(tb_ukr_x)) {
    print(exports_ukr_x$obj[2][nrow(exports_ukr_x$obs[[1]])])
    trade_datalist[length(trade_datalist)+1] <- data.frame(language = country$language, 
                                                           country = country$country, 
                                                           capital = country$capital, 
                                                           exports = exports_ukr_x$obj[[1]][[2]][nrow(exports_ukr_x$obs[[1]])], 
                                                           imports = imports_ukr_x$obj[[1]][[2]][nrow(exports_ukr_x$obs[[1]])],
                                                           balance = tb_ukr_x$obj[[1]][[2]][nrow(exports_ukr_x$obs[[1]])])
  }
}

countries_capitals_trade <- do.call(rbind, trade_datalist)
