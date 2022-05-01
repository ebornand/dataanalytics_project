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

exports_ukr_de <- filter(exports_ukr, counterpart_area == "DE" & frequency == "A")
exports_ukr_de$obs
