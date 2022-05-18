install.packages("rjson")
install.packages("ggplot2")
library("rjson")
library("ggplot2")
source("code/JSON_handler.R")
source("code/plotter.R")

# German
de_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=de_all&date__gte=2022-02-24&limit=30")
de_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=de_all&date__gte=2022-01-24&limit=31")

data_de_habit <- function.createHedonDataFrame(de_habit_json)
data_de_base <- function.createHedonDataFrame(de_base_json)

# English
en_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=en_all&date__gte=2022-02-24&limit=15")
en_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=en_all&date__gte=2022-01-24&limit=31")

data_en_habit <- function.createHedonDataFrame(en_habit_json)
data_en_base <- function.createHedonDataFrame(en_base_json)

# Russian
ru_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ru_all&date__gte=2022-02-24&limit=15")
ru_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ru_all&date__gte=2022-01-24&limit=31")

data_ru_habit <- function.createHedonDataFrame(ru_habit_json)
data_ru_base <- function.createHedonDataFrame(ru_base_json)

# Ukrainian
uk_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=uk_all&date__gte=2022-02-24&limit=15")
uk_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=uk_all&date__gte=2022-01-24&limit=31")

data_uk_habit <- function.createHedonDataFrame(uk_habit_json)
data_uk_base <- function.createHedonDataFrame(uk_base_json)

# Spanish
es_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=es_all&date__gte=2022-02-24&limit=15")
es_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=es_all&date__gte=2022-01-24&limit=31")

data_es_habit <- function.createHedonDataFrame(es_habit_json)
data_es_base <- function.createHedonDataFrame(es_base_json)

# Korean
ko_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ko_all&date__gte=2022-02-24&limit=15")
ko_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ko_all&date__gte=2022-01-24&limit=31")

data_ko_habit <- function.createHedonDataFrame(ko_habit_json)
data_ko_base <- function.createHedonDataFrame(ko_base_json)

# Indonesian
id_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=id_all&date__gte=2022-02-24&limit=15")
id_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=id_all&date__gte=2022-01-24&limit=31")

data_id_habit <- function.createHedonDataFrame(id_habit_json)
data_id_base <- function.createHedonDataFrame(id_base_json)

# Portuguese
pt_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=pt_all&date__gte=2022-02-24&limit=15")
pt_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=pt_all&date__gte=2022-01-24&limit=31")

data_pt_habit <- function.createHedonDataFrame(pt_habit_json)
data_pt_base <- function.createHedonDataFrame(pt_base_json)

# Arabic
ar_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ar_all&date__gte=2022-02-24&limit=15")
ar_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ar_all&date__gte=2022-01-24&limit=31")

data_ar_habit <- function.createHedonDataFrame(ar_habit_json)
data_ar_base <- function.createHedonDataFrame(ar_base_json)

# French
fr_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=fr_all&date__gte=2022-02-24&limit=15")
fr_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=fr_all&date__gte=2022-01-24&limit=31")

data_fr_habit <- function.createHedonDataFrame(fr_habit_json)
data_fr_base <- function.createHedonDataFrame(fr_base_json)

ggplot() + 
  geom_smooth(data = data_de_habit, aes(x = data_de_habit$date, y = data_de_habit$happiness), color = "#C0392B") +
  geom_smooth(data = data_en_habit, aes(x = data_en_habit$date, y = data_en_habit$happiness), color = "#9B59B6") +
  geom_smooth(data = data_es_habit, aes(x = data_es_habit$date, y = data_es_habit$happiness), color = "#2980B9") +
  geom_smooth(data = data_ru_habit, aes(x = data_ru_habit$date, y = data_ru_habit$happiness), color = "#1ABC9C") +
  geom_smooth(data = data_uk_habit, aes(x = data_uk_habit$date, y = data_uk_habit$happiness), color = "#27AE60") +
  geom_smooth(data = data_pt_habit, aes(x = data_pt_habit$date, y = data_pt_habit$happiness), color = "#F1C40F") +
  geom_smooth(data = data_id_habit, aes(x = data_id_habit$date, y = data_id_habit$happiness), color = "#F39C12") +
  geom_smooth(data = data_fr_habit, aes(x = data_fr_habit$date, y = data_fr_habit$happiness), color = "#E67E22") +
  geom_smooth(data = data_ko_habit, aes(x = data_ko_habit$date, y = data_ko_habit$happiness), color = "#D35400") +
  geom_smooth(data = data_ar_habit, aes(x = data_ar_habit$date, y = data_ar_habit$happiness), color = "#34495E") +
  xlab('Date') +
  ylab('Happiness Score') +
  labs(color="Languages")