import 'package:flutter/material.dart';

import '../utilities/forecast_util.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data!.list;
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList![index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecastList![index].temp.day.toStringAsFixed(0);
  var icon = forecastList![index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(fontSize: 25, color: Colors.black87),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      '$tempMin °C',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Image.network(
                    icon,
                    scale: 1.2,
                  )
                ],
              )
            ],
          ),
        ],
      )
    ],
  );
}
