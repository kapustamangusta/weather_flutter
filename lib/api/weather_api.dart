import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/constants.dart';

import '../utilities/locations.dart';

class WeatherApi {
  static Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {
    Location location = Location();
    await location.getCurrentLoaction();
    Map<String, String> parametrs;

    if (isCity==true) {
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName!,
      };
      parametrs = queryParametrs;
    }else{
      var queryParametrs = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.lat.toString(),
        'lon': location.lon.toString(),
      };
      parametrs = queryParametrs;
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parametrs);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);
    print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error("Error response");
    }
  }
}
