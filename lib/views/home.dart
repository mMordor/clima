import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/views/error_page.dart';
import 'package:clima/widgets/bottom_card.dart';
import 'package:clima/widgets/location_title.dart';
import 'package:clima/widgets/my_location_bottun.dart';
import 'package:clima/widgets/search_bar.dart';
import 'package:clima/widgets/temp_detail.dart';
import 'package:clima/widgets/weather_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'fetch_data_loading.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  late LocationService location ;
  late LocationPermission? _permission ;
  late Weather? weather;
  bool datafetched = false;
  bool iserrordetected = false;
  String errortitle = '';
  String errordescr = '';
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermission();
  }

  void checkPermission()async{
    _permission = await geolocatorPlatform.checkPermission();
    if(_permission == LocationPermission.denied){
      _permission = await Geolocator.requestPermission();
      if(_permission != LocationPermission.denied){
        if(_permission == LocationPermission.deniedForever){
          setState(() {
            iserrordetected = true;
            datafetched = true;
            errortitle = "Permission must accept in Settings";
            weather = null;
          });
        }
        else{
          updateUI();
        }
      }else{
        
        setState(() {
          iserrordetected = true;
          datafetched = true;
          errortitle = "App cant acces to your location";
          weather = null;
        });
      }
    }else{
        updateUI();
    }
  }

  void updateUI()async{ 
    if(!await Geolocator.isLocationServiceEnabled()){
      setState(() {
        datafetched = true;
        iserrordetected = true;
        errortitle = "Location is turned off";
        errordescr = "Please enable the location service to see weather condition for your location";
        weather = null;
      });
      return;
    }
    API apireq = API();
    var jdata = await apireq.getLocationWeather();
    if(jdata == null){
      setState(() {
        weather = null;
        datafetched = true;
        iserrordetected = true;
        errortitle = apireq.massage;
        errordescr = '';
      });
      return;
    }
    weather = Weather.fromjson(jdata);
    setState(() {
      datafetched = true;
      iserrordetected = false;
    });
  }
  
  void searchCityWeather(String city)async{
    API apireq = API();
    var data = await apireq.getCityWeather(city);
    if(data == null){
      setState((){
        weather = null;
        datafetched = true;
        iserrordetected = true;
        errortitle = apireq.massage;
        errordescr = '';
      });
      return;
    }
    weather = Weather.fromjson(data);
    setState(() {
      datafetched = true;
      iserrordetected = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(datafetched != true)
    {
      return const Loading();
    }else{
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white10,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: CustomeSearchBar(
                          onSubmitted: (val){
                            print(val);
                            if( val != '') {
                              searchCityWeather(val);
                              setState(() {
                                datafetched = false;
                              });
                            }                            
                          },
                        )
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left : 10.0),
                          child: MyLocationButton(onPressed: (){
                            setState(() {
                              datafetched = false;
                            });
                            checkPermission();
                          },)
                        )
                      )
                    ],
                  ),
                  iserrordetected == true ? ErrorPage(description: errordescr,title: errortitle,) :
                  SizedBox(
                    child: 
                    iserrordetected == true ? ErrorPage(description: errordescr,title: errortitle,) :
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical:15.0),
                          child: LocationTitle(icon: const Icon(Icons.location_city), location: "${weather!.city!},${weather!.country!}"),
                        ),
                        SvgPicture.asset(weather!.icon!,height: 250,color: Colors.white,),
                        TempDetails(temp: "${weather!.maintemp!.round()}°",descr: weather!.description!.toUpperCase(),),
                      ],
                    ),
                  ),
                  BottomCard(
                    children: [
                        WeatherDetails(tile: "FEELS LIKE", valu: weather == null ? "0°" : "${weather!.feelslike!.round()}°",iswind: false,),
                        WeatherDetails(tile: "HUMIDITY", valu: weather == null ? "0%" : "${weather!.humidity!.round()}%",iswind:false,),
                        WeatherDetails(tile: "WIND", valu: weather == null ? "0" : "${weather!.wind!.round()} ",iswind:true)
                    ]
                  )
                ],
              ),
            ),
          )
        ),
      );
    }
  }
}
