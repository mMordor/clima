import 'package:clima/constants/constants.dart';

class Weather{
  late String? city,country,description,icon;
  late dynamic maintemp,feelslike,humidity,wind,code;

  Weather({
    this.city,
    this.country,
    this.description,
    this.feelslike,
    this.humidity,
    this.code,
    this.maintemp,
    this.wind
  });

  Weather.fromjson(Map<String,dynamic> json){
    city = json['name'];
    country = json["sys"]["country"];
    description = json['weather'][0]['description'];
    feelslike = json['main']['feels_like'] ;
    humidity = json['main']['humidity'] ;
    code = json['weather'][0]['id'];
    icon = "images/weather_icons/${iconFinder(code)}${KWeathericonsmap[code.toString()]!['icon']}.svg";
    maintemp = json['main']['temp'] ;
    wind = json['wind']['speed'] ;

  }

  String iconFinder(int code){

    if (!(code > 699 && code < 800) && !(code > 899 && code < 1000)) {
      return 'wi-day-';
    }

    // Finally tack on the prefix.
    return '';
  }


}