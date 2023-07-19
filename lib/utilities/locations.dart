import 'dart:developer';

import 'package:geolocator/geolocator.dart';

class Location{
  double lat=0.0;
  double lon=0.0;

  Future<void> getCurrentLoaction() async{
    try{
      LocationPermission permission;
      permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation).timeout(Duration(seconds: 10));
      lat = position.latitude;
      lon = position.longitude;
      log('$lat, $lon');
    }catch(e){
      throw "Something goes wrong: $e";
    }
  }
}