import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/utilities/constants.dart';
class WeatherApi{
  static Future<WeatherForecast> fetchWeatherForecastWithCity({ required String cityName}) async{
    var queryParametrs = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, queryParametrs);
    log('request: ${uri.toString()}');

    var response = await http.get(uri);
    print('response: ${response?.body}');

    if(response.statusCode==200){
      return WeatherForecast.fromJson(json.decode(response.body));
    } else{
      throw Exception('Error response');
    }
  }
}