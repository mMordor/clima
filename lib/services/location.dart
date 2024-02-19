import 'package:geolocator/geolocator.dart';

class LocationService{
  double? latitued,longitued;

  Future setLocation  ()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
    latitued = position.latitude;
    longitued = position.longitude; 

  }

}