import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
//import 'package:weather_app/screens/weather_forecast_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather",
      home: LocationScreen(),
    );
  }
}

