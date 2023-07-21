import 'package:flutter/material.dart';

import '../models/weather_forecast_daily.dart';
import '../utilities/translator.dart';
import 'forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FutureBuilder<String>(
          future: Translator.ToRus('7-Day Weather Forecast'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              );
            }
            else{
              return Text('');
            }
          },
        ),
        Container(
          height: 140,
          padding: EdgeInsets.all(16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 200,
                    decoration: BoxDecoration(
                        boxShadow: [],
                        color: Colors.orange[100],
                        border: Border.all(
                          color: Colors.black87,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: forecastCard(snapshot, index),
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    width: 8,
                  ),
              itemCount: snapshot.data!.list!.length),
        ),
      ],
    );
  }
}
