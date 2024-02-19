import 'package:clima/constants/constants.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class API{

  String massage = '';

  Future getLocationWeather()async{
    LocationService  location = LocationService();
    await location.setLocation();
    String url = '$KOpenweatherurl?units=metric&lat=${location.latitued}&lon=${location.longitued}&appid=$APIkey';
    http.Response res = await http.get(Uri.parse(url));
    print(url);
    print(jsonDecode(res.body));
    if(res.statusCode == 200){
      massage = '';
      return jsonDecode(res.body);
    }else if(res.statusCode <= 400 && res.statusCode < 500){
      massage = "Location is not working good!";
      return null;  
    }else{
      massage = "No Conection!";
      return null;
    }
    
  }

  Future getCityWeather(String cityname)async{
    String url = '$KOpenweatherurl?q=$cityname&units=metric&appid=$APIkey';
    http.Response res = await http.get(Uri.parse(url));
    print(url);
    print(jsonDecode(res.body));
    print(res.statusCode);
    if(res.statusCode == 200){
      massage = '';
      return jsonDecode(res.body);
    }else if(res.statusCode == 404){
      massage = "We can't find \"$cityname\" ";
    }else{
      massage = "Something wrong!";
      return null;
    }
  }

}