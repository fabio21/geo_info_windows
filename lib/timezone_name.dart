const timeZoneInfoMap = {
  "Dateline Standard Time": {
    "utc": "-12:00",
    "zone": ["Linha de Data Internacional Oeste"]
  },
  "UTC-11": {
    "utc": "-11:00",
    "zone": ["Tempo Universal Coordenado-11"]
  },
  "Hawaiian Standard Time": {
    "utc": "-10:00",
    "zone": ["Havaí"]
  },
  "Aleutian Standard Time": {
    "utc": "-10:00",
    "zone": ["Ilhas Aleutas"]
  },
  "Marquesas Standard Time": {
    "utc": "-09:30",
    "zone": ["Ilhas Marquesas"]
  },
  "Alaskan Standard Time": {
    "utc": "-09:00",
    "zone": ["Alasca"]
  },
  "UTC-09": {
    "utc": "-09:00",
    "zone": ["Tempo Universal Coordenado-09"]
  },
  "Pacific Standard Time (Mexico)": {
    "utc": "-08:00",
    "zone": ["Baja Califórnia"]
  },
  "Pacific Standard Time": {
    "utc": "-08:00",
    "zone": ["Hora do Pacífico (EUA e Canadá)"]
  },
  "UTC-08": {
    "utc": "-08:00",
    "zone": ["Tempo Universal Coordenado-08"]
  },
  "US Mountain Standard Time": {
    "utc": "-07:00",
    "zone": ["Arizona"]
  },
  "Mountain Standard Time (Mexico)": {
    "utc": "-07:00",
    "zone": ["Chihuahua", "La Paz", "Mazatlan"]
  },
  "Mountain Standard Time": {
    "utc": "-07:00",
    "zone": ["Hora das Montanhas (EUA e Canadá)"]
  },
  "Yukon Standard Time": {
    "utc": "-07:00",
    "zone": ["Yukon"]
  },
  "Central America Standard Time": {
    "utc": "-06:00",
    "zone": ["América Central"]
  },
  "Central Standard Time (Mexico)": {
    "utc": "-06:00",
    "zone": ["Guadalajara", "Cidade do México", "Monterrey"]
  },
  "Central Standard Time": {
    "utc": "-06:00",
    "zone": ["Hora Central (EUA e Canadá)"]
  },
  "Easter Island Standard Time": {
    "utc": "-06:00",
    "zone": ["Ilha da Páscoa"]
  },
  "Canada Central Standard Time": {
    "utc": "-06:00",
    "zone": ["Saskatchewan"]
  },
  "SA Pacific Standard Time": {
    "utc": "-05:00",
    "zone": ["Bogotá", "Lima", "Quito", "Rio Branco"]
  },
  "Eastern Standard Time (Mexico)": {
    "utc": "-05:00",
    "zone": ["Chetumal"]
  },
  "Haiti Standard Time": {
    "utc": "-05:00",
    "zone": ["Haiti"]
  },
  "Cuba Standard Time": {
    "utc": "-05:00",
    "zone": ["Havana"]
  },
  "Eastern Standard Time": {
    "utc": "-05:00",
    "zone": ["Hora Oriental (EUA e Canadá)"]
  },
  "US Eastern Standard Time": {
    "utc": "-05:00",
    "zone": ["Indiana (Leste)"]
  },
  "Turks And Caicos Standard Time": {
    "utc": "-05:00",
    "zone": ["Turcos e Caicos"]
  },
  "Paraguay Standard Time": {
    "utc": "-04:00",
    "zone": ["Assunção"]
  },
  "Venezuela Standard Time": {
    "utc": "-04:00",
    "zone": ["Caracas"]
  },
  "Central Brazilian Standard Time": {
    "utc": "-04:00",
    "zone": ["Cuiabá"]
  },
  "SA Western Standard Time": {
    "utc": "-04:00",
    "zone": ["Georgetown", "La Paz", "Manaus", "San Juan"]
  },
  "Atlantic Standard Time": {
    "utc": "-04:00",
    "zone": ["Hora do Atlântico (Canadá)"]
  },
  "Pacific SA Standard Time": {
    "utc": "-04:00",
    "zone": ["Santiago"]
  },
  "Newfoundland Standard Time": {
    "utc": "-03:30",
    "zone": ["Newfoundland"]
  },
  "Tocantins Standard Time": {
    "utc": "-03:00",
    "zone": ["Araguaina"]
  },
  "E. South America Standard Time": {
    "utc": "-03:00",
    "zone": ["Brasília"]
  },
  "SA Eastern Standard Time": {
    "utc": "-03:00",
    "zone": ["Caiena", "Fortaleza"]
  },
  "Argentina Standard Time": {
    "utc": "-03:00",
    "zone": ["Cidade de Buenos Aires"]
  },
  "Greenland Standard Time": {
    "utc": "-03:00",
    "zone": ["Groenlândia"]
  },
  "Montevideo Standard Time": {
    "utc": "-03:00",
    "zone": ["Montevidéu"]
  },
  "Magallanes Standard Time": {
    "utc": "-03:00",
    "zone": ["Punta Arenas"]
  },
  "Bahia Standard Time": {
    "utc": "-03:00",
    "zone": ["Salvador"]
  },
  "Saint Pierre Standard Time": {
    "utc": "-03:00",
    "zone": ["São Pedro e Miquelon"]
  },
  "UTC-02": {
    "utc": "-02:00",
    "zone": ["Tempo Universal Coordenado-02"]
  },
  "Azores Standard Time": {
    "utc": "-01:00",
    "zone": ["Açores"]
  },
  "Cape Verde Standard Time": {
    "utc": "-01:00",
    "zone": ["Ilha de Cabo Verde"]
  },
  "UTC": {
    "utc": "00:00",
    "zone": ["Tempo Universal Coordenado"]
  },
  "GMT Standard Time": {
    "utc": "+00:00",
    "zone": ["Dublin", "Edinburgo", "Lisboa", "Londres"]
  },
  "Greenwich Standard Time": {
    "utc": "+00:00",
    "zone": ["Monróvia", "Reykjavik"]
  },
  "Sao Tome Standard Time": {
    "utc": "+00:00",
    "zone": ["São Tomé"]
  },
  "Morocco Standard Time": {
    "utc": "+01:00",
    "zone": ["Casablanca"]
  },
  "W. Europe Standard Time": {
    "utc": "+01:00",
    "zone": ["Amsterdã", "Berlim", "Berna", "Roma", "Estocolmo", "Viena"]
  },
  "Central Europe Standard Time": {
    "utc": "+01:00",
    "zone": ["Belgrado", "Bratislava", "Budapeste", "Liubliana", "Praga"]
  },
  "Romance Standard Time": {
    "utc": "+01:00",
    "zone": ["Bruxelas", "Copenhague", "Madri", "Paris"]
  },
  "W. Central Africa Standard Time": {
    "utc": "+01:00",
    "zone": ["Centro-oeste da África"]
  },
  "Central European Standard Time": {
    "utc": "+01:00",
    "zone": ["Sarajevo", "Skoplie", "Varsóvia", "Zagreb"]
  },
  "Jordan Standard Time": {
    "utc": "+02:00",
    "zone": ["Amã"]
  },
  "GTB Standard Time": {
    "utc": "+02:00",
    "zone": ["Atenas", "Bucareste"]
  },
  "Middle East Standard Time": {
    "utc": "+02:00",
    "zone": ["Beirute"]
  },
  "Egypt Standard Time": {
    "utc": "+02:00",
    "zone": ["Cairo"]
  },
  "Sudan Standard Time": {
    "utc": "+02:00",
    "zone": ["Cartum"]
  },
  "E. Europe Standard Time": {
    "utc": "+02:00",
    "zone": ["Chisinau"]
  },
  "Syria Standard Time": {
    "utc": "+02:00",
    "zone": ["Damasco"]
  },
  "West Bank Standard Time": {
    "utc": "+02:00",
    "zone": ["Gaza", "Hebron"]
  },
  "South Africa Standard Time": {
    "utc": "+02:00",
    "zone": ["Harare", "Pretória"]
  },
  "FLE Standard Time": {
    "utc": "+02:00",
    "zone": ["Helsinque", "Kiev", "Riga", "Sófia", "Tallinn", "Vilnius"]
  },
  "Israel Standard Time": {
    "utc": "+02:00",
    "zone": ["Jerusalém"]
  },
  "South Sudan Standard Time": {
    "utc": "+02:00",
    "zone": ["Juba"]
  },
  "Kaliningrad Standard Time": {
    "utc": "+02:00",
    "zone": ["Kaliningrado"]
  },
  "Libya Standard Time": {
    "utc": "+02:00",
    "zone": ["Trípoli"]
  },
  "Namibia Standard Time": {
    "utc": "+02:00",
    "zone": ["Windhoek"]
  },
  "Arabic Standard Time": {
    "utc": "+03:00",
    "zone": ["Bagdá"]
  },
  "Turkey Standard Time": {
    "utc": "+03:00",
    "zone": ["Istambul"]
  },
  "Arab Standard Time": {
    "utc": "+03:00",
    "zone": ["Kuwait", "Riad"]
  },
  "Belarus Standard Time": {
    "utc": "+03:00",
    "zone": ["Minsk"]
  },
  "Russian Standard Time": {
    "utc": "+03:00",
    "zone": ["Moscou", "São Petersburgo"]
  },
  "E. Africa Standard Time": {
    "utc": "+03:00",
    "zone": ["Nairóbi"]
  },
  "Volgograd Standard Time": {
    "utc": "+03:00",
    "zone": ["Volgogrado"]
  },
  "Iran Standard Time": {
    "utc": "+03:30",
    "zone": ["Teerã"]
  },
  "Arabian Standard Time": {
    "utc": "+04:00",
    "zone": ["Abu Dhabi", "Mascate"]
  },
  "Astrakhan Standard Time": {
    "utc": "+04:00",
    "zone": ["Astrakhan", "Ulyanovsk"]
  },
  "Azerbaijan Standard Time": {
    "utc": "+04:00",
    "zone": ["Baku"]
  },
  "Caucasus Standard Time": {
    "utc": "+04:00",
    "zone": ["Ierevan"]
  },
  "Russia Time Zone 3": {
    "utc": "+04:00",
    "zone": ["Izhevsk", "Samara"]
  },
  "Mauritius Standard Time": {
    "utc": "+04:00",
    "zone": ["Port Louis"]
  },
  "Saratov Standard Time": {
    "utc": "+04:00",
    "zone": ["Saratov"]
  },
  "Georgian Standard Time": {
    "utc": "+04:00",
    "zone": ["Tbilisi"]
  },
  "Afghanistan Standard Time": {
    "utc": "+04:30",
    "zone": ["Cabul"]
  },
  "West Asia Standard Time": {
    "utc": "+04:30",
    "zone": ["Ashgabat", "Tashkent"]
  },
  "Ekaterinburg Standard Time": {
    "utc": "+05:00",
    "zone": ["Ekaterimburgo"]
  },
  "Pakistan Standard Time": {
    "utc": "+05:00",
    "zone": ["Islamabad", "Karachi"]
  },
  "Qyzylorda Standard Time": {
    "utc": "+05:00",
    "zone": ["Qyzylorda"]
  },
  "India Standard Time": {
    "utc": "+05:30",
    "zone": ["Chennai (Madras)", "Kolkata (Calcutá)", "Mumbai", "Nova Délhi"]
  },
  "Sri Lanka Standard Time": {
    "utc": "+05:30",
    "zone": ["Sri Jayawardenepura"]
  },
  "Nepal Standard Time": {
    "utc": "+05:45",
    "zone": ["Katmandu"]
  },
  "Central Asia Standard Time": {
    "utc": "+06:00",
    "zone": ["Astana"]
  },
  "Bangladesh Standard Time": {
    "utc": "+06:00",
    "zone": ["Dacca"]
  },
  "Omsk Standard Time": {
    "utc": "+06:00",
    "zone": ["Omsk"]
  },
  "Myanmar Standard Time": {
    "utc": "+06:30",
    "zone": ["Yangon (Rangoon)"]
  },
  "SE Asia Standard Tim": {
    "utc": "+07:00",
    "zone": ["Bancoc", "Hanói", "Jacarta"]
  },
  "Altai Standard Time": {
    "utc": "+07:00",
    "zone": ["Barnaul", "Gorno-Altaysk"]
  },
  "W. Mongolia Standard Time": {
    "utc": "+07:00",
    "zone": ["Hovd"]
  },
  "North Asia Standard Tim": {
    "utc": "+07:00",
    "zone": ["Krasnoyarsk"]
  },
  "N. Central Asia Standard Time": {
    "utc": "+07:00",
    "zone": ["Novosibirsk"]
  },
  "Tomsk Standard Time": {
    "utc": "+07:00",
    "zone": ["Tomsk"]
  },
  "North Asia East Standard Time": {
    "utc": "+08:00",
    "zone": ["Irkutsk"]
  },
  "Singapore Standard Time": {
    "utc": "+08:00",
    "zone": ["Kuala Lumpur", "Cingapura"]
  },
  "China Standard Time": {
    "utc": "+08:00",
    "zone": ["Pequim", "Chonquim", "Hong Kong", "Urumqui"]
  },
  "W. Australia Standard Time": {
    "utc": "+08:00",
    "zone": ["Perth"]
  },
  "Taipei Standard Time": {
    "utc": "+08:00",
    "zone": ["Taipé"]
  },
  "Ulaanbaatar Standard Time": {
    "utc": "+08:00",
    "zone": ["Ulaanbaatar"]
  },
  "Aus Central W. Standard Time": {
    "utc": "+08:45",
    "zone": ["Eucla"]
  },
  "Transbaikal Standard Time": {
    "utc": "+09:00",
    "zone": ["Chita"]
  },
  "Tokyo Standard Time": {
    "utc": "+09:00",
    "zone": ["Osaka", "Sapporo", "Tóquio"]
  },
  "North Korea Standard Time": {
    "utc": "+09:00",
    "zone": ["Pyongyang"]
  },
  "Korea Standard Time": {
    "utc": "+09:00",
    "zone": ["Seul"]
  },
  "Yakutsk Standard Time": {
    "utc": "+09:00",
    "zone": ["Yakutsk"]
  },
  "Cen. Australia Standard Time": {
    "utc": "+09:30",
    "zone": ["Adelaide"]
  },
  "AUS Central Standard Time": {
    "utc": "+09:30",
    "zone": ["Darwin"]
  },
  "E. Australia Standard Time": {
    "utc": "+10:00",
    "zone": ["Brisbane"]
  },
  "AUS Eastern Standard Time": {
    "utc": "+10:00",
    "zone": ["Camberra", "Melbourne", "Sydney"]
  },
  "West Pacific Standard Time": {
    "utc": "+10:00",
    "zone": ["Guam", "Port Moresby"]
  },
  "Tasmania Standard Time": {
    "utc": "+10:00",
    "zone": ["Hobart"]
  },
  "Vladivostok Standard Time": {
    "utc": "+10:00",
    "zone": ["Vladivostok"]
  },
  "Lord Howe Standard Time": {
    "utc": "+10:30",
    "zone": ["Ilha Lord Howe"]
  },
  "Russia Time Zone 10": {
    "utc": "+11:00",
    "zone": ["Chokurdakh"]
  },
  "Bougainville Standard Time": {
    "utc": "+11:00",
    "zone": ["Ilha Bougainville"]
  },
  "Norfolk Standard Time": {
    "utc": "+11:00",
    "zone": ["Ilha Norfolk"]
  },
  "Central Pacific Standard Time": {
    "utc": "+11:00",
    "zone": ["Ilhas Salomão", "Nova Caledônia"]
  },
  "Magadan Standard Time": {
    "utc": "+11:00",
    "zone": ["Magadã"]
  },
  "Sakhalin Standard Time": {
    "utc": "+11:00",
    "zone": ["Sakhalin"]
  },
  "Russia Time Zone 11": {
    "utc": "+12:00",
    "zone": ["Anadyr", " Petropavlovsk-Kamchatsky"]
  },
  "New Zealand Standard Time": {
    "utc": "+12:00",
    "zone": ["Auckland", "Wellington"]
  },
  "Fiji Standard Time": {
    "utc": "+12:00",
    "zone": ["Fiji"]
  },
  "UTC+12": {
    "utc": "+12:00",
    "zone": ["Tempo Universal Coordenado+12"]
  },
  "Chatham Islands Standard Time": {
    "utc": "+12:45",
    "zone": ["Ilhas Chatham"]
  },
  "Tonga Standard Time": {
    "utc": "+13:00",
    "zone": ["Nuku'alofa"]
  },
  "Samoa Standard Time": {
    "utc": "+13:00",
    "zone": ["Samoa"]
  },
  "UTC+13": {
    "utc": "+13:00",
    "zone": ["Tempo Universal Coordenado+13"]
  },
  "Line Islands Standard Time": {
    "utc": "+14:00",
    "zone": ["Ilha Kiritimati"]
  }
};
