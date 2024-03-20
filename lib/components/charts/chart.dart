import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Chart extends StatelessWidget {
  final String stockTicker;

  const Chart({
    super.key,
    required this.stockTicker,
  });

  @override
  Widget build(BuildContext context) {
    final List<FlSpot> stockPrices = [
      // Replace with your actual data (ensure valid numbers)
      FlSpot(1.0, 100),
      FlSpot(2.5, 120), // Example with a decimal value
      FlSpot(3.0, 135),
      FlSpot(4.8, 110), // Another example with a decimal value
      FlSpot(5.0, 145),
    ];

    return Scaffold(
      body: SizedBox(
        height: 300.0,
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: stockPrices,
                isCurved: true, // Set to true for a curved line graph
                color: Colors.blue,
                barWidth: 2, // Adjust bar width as needed
                belowBarData: BarAreaData(
                  // Optional for filling below the line
                  show: true,
                  color: Colors.blue.withOpacity(0.3),
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
                  reservedSize: 22, // Adjust reserved space for titles
                  getTitlesWidget: (value, titleConfig) => // Anonymous function
                      Text(
                    // Check for NaN and display "N/A"
                    value.isNaN
                        ? 'N/A'
                        : value.toString(), // Adjust for data type if needed
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30, // Adjust reserved space for titles
                  getTitlesWidget: (value, titleConfig) => // Anonymous function
                      Text(
                    value.toString(), // Adjust for data type if needed
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
