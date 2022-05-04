#English
en_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=en_all&date__gte=2022-02-24&limit=1000")
en_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=en_all&date__gte=2022-01-24&limit=31")

data_en_habit <- function.createHedonDataFrame(en_habit_json)
data_en_base <- function.createHedonDataFrame(en_base_json)

#German
de_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=de_all&date__gte=2022-02-24&limit=1000")
de_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=de_all&date__gte=2022-01-24&limit=31")

data_de_habit <- function.createHedonDataFrame(de_habit_json)
data_de_base <- function.createHedonDataFrame(de_base_json)

#Russian
ru_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ru_all&date__gte=2022-02-24&limit=1000")
ru_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ru_all&date__gte=2022-01-24&limit=31")

data_ru_habit <- function.createHedonDataFrame(ru_habit_json)
data_ru_base <- function.createHedonDataFrame(ru_base_json)

#Spanish
es_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=es_all&date__gte=2022-02-24&limit=1000")
es_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=es_all&date__gte=2022-01-24&limit=31")

data_es_habit <- function.createHedonDataFrame(es_habit_json)
data_es_base <- function.createHedonDataFrame(es_base_json)

#Portuguese
pt_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=pt_all&date__gte=2022-02-24&limit=1000")
pt_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=pt_all&date__gte=2022-01-24&limit=31")

data_pt_habit <- function.createHedonDataFrame(pt_habit_json)
data_pt_base <- function.createHedonDataFrame(pt_base_json)

#French
fr_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=fr_all&date__gte=2022-02-24&limit=1000")
fr_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=fr_all&date__gte=2022-01-24&limit=31")

data_fr_habit <- function.createHedonDataFrame(fr_habit_json)
data_fr_base <- function.createHedonDataFrame(fr_base_json)

#Arabic
ar_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ar_all&date__gte=2022-02-24&limit=1000")
ar_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ar_all&date__gte=2022-01-24&limit=31")

data_ar_habit <- function.createHedonDataFrame(ar_habit_json)
data_ar_base <- function.createHedonDataFrame(ar_base_json)

#Indonesian
id_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=id_all&date__gte=2022-02-24&limit=1000")
id_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=id_all&date__gte=2022-01-24&limit=31")

data_id_habit <- function.createHedonDataFrame(ar_habit_json)
data_id_base <- function.createHedonDataFrame(ar_base_json)

#Korean
ko_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ko_all&date__gte=2022-02-24&limit=1000")
ko_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=ko_all&date__gte=2022-01-24&limit=31")

data_ko_habit <- function.createHedonDataFrame(ar_habit_json)
data_ko_base <- function.createHedonDataFrame(ar_base_json)

#Ukrainian
ua_habit_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=uk_all&date__gte=2022-02-24&limit=1000")
ua_base_json <- fromJSON(file = "http://hedonometer.org/api/v1/happiness/?format=json&timeseries__title=uk_all&date__gte=2022-01-24&limit=31")

data_ua_habit <- function.createHedonDataFrame(ua_habit_json)
data_ua_base <- function.createHedonDataFrame(ua_base_json)



data_hedon_total <- list(list("english", data_en_base, data_en_habit), 
                         list("german", data_de_base, data_de_habit), 
                         list("russian", data_ru_base, data_ru_habit), 
                         list("spanish", data_es_base, data_es_habit), 
                         list("portuguese", data_pt_base, data_pt_habit), 
                         list("french", data_fr_base, data_fr_habit), 
                         list("arabic", data_ar_base, data_ar_habit), 
                         list("ukrainian", data_ua_base, data_ua_habit))