install.packages("rjson")
library("rjson")

countries_english <- strsplit("Antigua and Barbuda; Barbados; Belize; Botswana; Burundi; Cameroon; Canada; Cape Verde; Dominica; Eritrea; Eswatini; Fiji; Grenada; Guyana; Ireland; Kenya; Kiribati; Lesotho; Liberia; Malawi; Malta; Namibia; New Zealand; Nigeria; Pakistan; Palau; Palestinian State; Papua New Guinea; Philippines; Rwanda; Samoa; Seychelles; Sierra Leone; Singapore; Solomon Islands; South Africa; South Sudan; Sudan; Tanzania; Tonga; Trinidad and Tobago; Tuvalu; Uganda; United Kingdom; United States; Vanuatu; Zambia; Zimbabwe", ";")
countries_german <- strsplit("Austria; Belgium; Germany; Italy; Liechtenstein; Luxembourg; Switzerland", ";")
countries_russian <- strsplit("Belarus; Kazakhstan; Kyrgyzstan; Russia", ";")
countries_spanish <- strsplit("Argentina; Bolivia; Chile; Colombia; Costa Rica; Cuba; Dominican Republic; East Timor; Ecuador; El Salvador; Equatorial Guinea; Guatemala; Honduras; Mexico; Micronesia; Nicaragua; Panama; Paraguay; Peru; Spain; Uruguay; Venezuela", ";")
countries_portuguese <- strsplit("Angola; Brazil; Equatorial Guinea; Guinea-Bissau; Mozambique; Myanmar; Portugal; Democratic Republic of São Tomé and Príncipe", ";")
countries_french <- strsplit("Belgium; Benin; Burkina Faso; Burundi; Cameroon; Canada; Cape Verde; Central African Republic; Chad; Comoros; Democratic Republic of the Congo; Republic of Congo; Côte d’Ivoire; Djibouti; Equatorial Guinea; France; Gabon; Gambia; Guinea; Haiti; Luxembourg; Madagascar; Mali; Monaco; Niger; Rwanda; Senegal; Seychelles; Switzerland; Togo; Vanuatu Chinese", ";")
countries_arabic <- strsplit("Algeria; Bahrain; Chad; Comoros; Djibouti; Egypt; Eritrea; Iraq; Jordan; Kuwait; Lebanon; Libya; Mauritania; Morocco; Oman; Qatar; Saudi Arabia; Somalia; Sudan; Syria; Tunisia; United Arab Emirates; Yemen", ";")

countries_capitals <- fromJSON(file = "https://countriesnow.space/api/v0.1/countries/capital")
countries_capitals <- countries_capitals$data
