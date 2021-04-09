import 'dart:async';
import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileHistory extends StatefulWidget {
  @override
  _ProfileHistoryState createState() => _ProfileHistoryState();
}

class _ProfileHistoryState extends State<ProfileHistory> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LineChart( 
      LineChartData(
          minX: 0,
          maxX: 12,
          minY: 0,
          maxY: 100,
          gridData: FlGridData(
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d), 
                strokeWidth: 1,
                );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 0),
                FlSpot(1, 4),
                FlSpot(2, 10),
                FlSpot(3, 19),
                FlSpot(4, 24),
                FlSpot(5, 21),
                FlSpot(6, 27),
                FlSpot(7, 31),
                FlSpot(8, 33),
                FlSpot(9, 36),
                FlSpot(10, 40),
                FlSpot(11, 46),
                FlSpot(12, 51),
              ]
              
            )
          ]
      ),
    ),
    );
  }
}