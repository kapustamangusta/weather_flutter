import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;

  const WeatherForecastScreen({this.locationWeather});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = '';

  @override
  void initState() {
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: Text('ArtSochi Weather'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi.fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CityScreen()));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi.fetchWeatherForecast(
                      cityName: _cityName, isCity: true);
                });
              }
            },
            icon: Icon(Icons.location_city),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
                future: forecastObject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        CityView(snapshot: snapshot),
                        SizedBox(
                          height: 50,
                        ),
                        TempView(snapshot: snapshot),
                        SizedBox(
                          height: 50,
                        ),
                        DetailView(snapshot: snapshot),
                        SizedBox(
                          height: 50,
                        ),
                        BottomListView(snapshot: snapshot),
                      ],
                    );
                  } else {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 100
                      ),
                      child: Text(
                        'City not found.\nPlease, enter correct city!',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
