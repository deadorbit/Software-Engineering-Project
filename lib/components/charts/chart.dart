import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:software_engineering_project/service/api_manipulation.dart';

class StockDataPoint {
  int date;
  double closePrice;

  StockDataPoint(this.date, this.closePrice);
}

String intToDateString(int dayOfYear) {
  // Months and their corresponding days
  const monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  int month = 0;
  int day = dayOfYear;

  // Find the month
  while (day > monthDays[month] && month < 11) {
    day -= monthDays[month];
    month++;
  }

  // Adjusting for 0-based indexing
  month++;

  // Format the output
  return "${month.toString().padLeft(2, '0')}/${day.toString().padLeft(2, '0')}";
}

List<StockDataPoint> assignDates(List<double> closePrices) {
  final List<StockDataPoint> dataPoints = [];
  DateTime currentDate = DateTime.now();
  DateTime startOfYear = DateTime(currentDate.year);
  int currentDay = currentDate.difference(startOfYear).inDays + 1;

  for (int i = 0; i < closePrices.length; i++) {
    currentDay--; // Decrement for the previous day
    dataPoints.add(StockDataPoint(currentDay, closePrices[i]));

    if (currentDay == 0) {
      currentDay = 365;
    }
  }

  return dataPoints.reversed.toList(); // Reverse the list for correct order
}

List<FlSpot> stockDataPointToFLSpot(List<StockDataPoint> stockDataPoints) {
  final List<FlSpot> flSpots = [];
  for (var dataPoint in stockDataPoints) {
    double close = dataPoint.closePrice;
    int date = dataPoint.date;
    flSpots.add(FlSpot(date.toDouble(), close));
  }

  return flSpots;
}

class Chart extends StatefulWidget {
  final String stockTicker;

  const Chart({
    super.key,
    required this.stockTicker,
  });

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<FlSpot> _stockPrices = [];
  bool _isLoading = true;
  double minY = 100000.0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    final apiManipulation = APIManipulation();
    final List<dynamic> APIstockPrices =
        await apiManipulation.getOneMonthJson(widget.stockTicker);
    final List<double> closePrices = [];

    List<StockDataPoint> dataPoints = [];
    List<FlSpot> stockPrices = [];

    var maxY = 0.0;
    var maxX = 0.0;

    for (var record in APIstockPrices) {
      double close = record['Close'].toDouble();
      if (close > maxY) {
        maxY = close;
      }
      if (close < minY) {
        minY = close;
      }

      closePrices.add(close);
    }

    dataPoints = assignDates(closePrices);
    stockPrices = stockDataPointToFLSpot(dataPoints);
    for (var stock in stockPrices) {
      if (stock.x > maxX) {
        maxX = stock.x;
      }
    }

    stockPrices.add(FlSpot.nullSpot);
    stockPrices.add(FlSpot(maxX, maxY * 1.02));

    setState(() {
      _stockPrices = stockPrices;
      _isLoading = false;
    });
    //print(stockPrices.length);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoading) {
      return Scaffold(
        body: SizedBox(
          height: 300.0,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(
                drawVerticalLine: false,
              ),
              //clipData: FlClipData(
              //top: false, bottom: false, left: true, right: false),
              lineBarsData: [
                LineChartBarData(
                  shadow: const Shadow(blurRadius: 5),
                  preventCurveOverShooting: true,
                  spots: _stockPrices,
                  dotData: const FlDotData(show: false),
                  isCurved: true, // Set to true for a curved line graph

                  //color: Colors.green[900],
                  gradient: const LinearGradient(
                      //begin: Alignment(300, 300),
                      transform: GradientRotation(1.57079633),
                      colors: [
                        Color.fromRGBO(76, 175, 80, 1),
                        Color.fromRGBO(255, 241, 118, 1)
                      ]),
                  barWidth: 3, // Adjust bar width as needed
                  belowBarData: BarAreaData(
                    // Optional for filling below the line
                    show: true,
                    color: Colors.green[900]?.withOpacity(0.3),
                  ),
                ),
              ],
              borderData: FlBorderData(
                show: true,
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,

                    reservedSize: 22,
                    //interval: 10.0,
                    getTitlesWidget: (value, titleConfig) => Text(
                      value.isNaN
                          ? 'N/A'
                          : intToDateString(
                              value.toInt()), // Your original logic */
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 30, // Adjust reserved space for titles
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 45.0,
                    //interval: 2.0,
                    getTitlesWidget: (value, titleConfig) =>
                        value == _stockPrices.last.y || value == minY
                            ? const Text('')
                            : // Anonymous function
                            Text(
                                // Check for NaN and display "N/A"
                                value.isNaN
                                    ? 'N/A'
                                    : value.toStringAsFixed(
                                        2), // Adjust for data type if needed
                              ),
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return const Scaffold();
    }
  }
}
