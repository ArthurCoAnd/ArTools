//  ██████ ███████        ██████ ██      ██ ███    ███  █████  
// ██      ██            ██      ██      ██ ████  ████ ██   ██ 
// ██      ███████ █████ ██      ██      ██ ██ ████ ██ ███████ 
// ██           ██       ██      ██      ██ ██  ██  ██ ██   ██ 
//  ██████ ███████        ██████ ███████ ██ ██      ██ ██   ██ 

class CSClima{
  final DateTime dt;
  final double temperatura;
  final int umidade;
  final int chuva;
  final int codigo;

  CSClima({
    required this.dt,
    required this.temperatura,
    required this.umidade,
    required this.chuva,
    required this.codigo,
  });

  String? codigo2txt(){
    final Map txt = {0: 'Céu Limpo', 1: 'Parcialmente Nublado', 2: 'Parcialmente Nublado', 3: 'Parcialmente Nublado', 45: 'Nublado', 48: 'Nublado', 51: 'Chuva Leve', 53: 'Chuva Leve', 55: 'Chuva Leve', 56: 'Chuva Leve Congelante', 57: 'Chuva Leve Congelante', 61: 'Chuva', 63: 'Chuva', 65: 'Chuva', 66: 'Chuva Congelante', 67: 'Chuva Congelante', 71: 'Nevando', 73: 'Nevando', 75: 'Nevando', 77: 'Flocos de Neve', 80: 'Pancada de Chuva', 81: 'Pancada de Chuva', 82: 'Pancada de Chuva', 85: 'Pancada de Neve', 86: 'Pancada de Neve', 95: 'Tempestade', 96: 'Tempestade com Granizo', 99: 'Tempestade com Granizo'};
    return txt[codigo];
  }

  String? codigo2img(){
    final Map img = {0: "http://openweathermap.org/img/wn/01n@2x.png",1: "http://openweathermap.org/img/wn/01n@2x.png",2: "http://openweathermap.org/img/wn/02n@2x.png",3: "http://openweathermap.org/img/wn/03n@2x.png",45: "http://openweathermap.org/img/wn/50n@2x.png",48: "http://openweathermap.org/img/wn/50n@2x.png",51: "http://openweathermap.org/img/wn/09n@2x.png",53: "http://openweathermap.org/img/wn/09n@2x.png",55: "http://openweathermap.org/img/wn/09n@2x.png",56: "http://openweathermap.org/img/wn/09n@2x.png",57: "http://openweathermap.org/img/wn/09n@2x.png",61: "http://openweathermap.org/img/wn/10n@2x.png",63: "http://openweathermap.org/img/wn/10n@2x.png",65: "http://openweathermap.org/img/wn/10n@2x.png",66: "http://openweathermap.org/img/wn/10n@2x.png",67: "http://openweathermap.org/img/wn/10n@2x.png",71: "http://openweathermap.org/img/wn/13n@2x.png",73: "http://openweathermap.org/img/wn/13n@2x.png",75: "http://openweathermap.org/img/wn/13n@2x.png",77: "http://openweathermap.org/img/wn/13n@2x.png",80: "http://openweathermap.org/img/wn/09n@2x.png",81: "http://openweathermap.org/img/wn/09n@2x.png",82: "http://openweathermap.org/img/wn/09n@2x.png",85: "http://openweathermap.org/img/wn/13n@2x.png",86: "http://openweathermap.org/img/wn/13n@2x.png",95: "http://openweathermap.org/img/wn/11n@2x.png",96: "http://openweathermap.org/img/wn/11n@2x.png",99: "http://openweathermap.org/img/wn/11n@2x.png"};
    return img[codigo];
  }
}

// weather_code
// '0': 'Céu Limpo',
// '1, 2, 3': 'Parcialmente Nublado',
// '45, 48': 'Nublado',
// '51, 53, 55': 'Chuva Leve',
// '56, 57': 'Chuva Leve Congelante',
// '61, 63, 65': 'Chuva',
// '66, 67': 'Chuva Congelante',
// '71, 73, 75': 'Nevando',
// '77': 'Flocos de Neve',
// '80, 81, 82': 'Pancada de Chuva',
// '85, 86': 'Pancada de Neve',
// '95': 'Tempestade',
// '96, 99': 'Tempestade com Granizo',