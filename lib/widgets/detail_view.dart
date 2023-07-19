import 'package:flutter/material.dart';
import 'package:weather_app/utilities/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/weather_forecast_daily.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var pressure = forecastList![0].pressure!*0.750062;
    var humidity = forecastList![0].humidity!;
    var wind = forecastList![0].speed!;
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Util.getitem(FontAwesomeIcons.thermometerThreeQuarters, pressure.round(), 'mm Hg'),
          Util.getitem(FontAwesomeIcons.cloudRain, humidity.round(), '%'),
           Util.getitem(FontAwesomeIcons.wind, wind.round(), 'm/s'),
        ],
      ),
    );
  }
}