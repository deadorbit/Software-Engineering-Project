import 'package:flutter/material.dart';
import 'package:software_engineering_project/components/charts/chart.dart';

class ChartDisplay extends StatelessWidget {
  final String stockTicker;

  const ChartDisplay({super.key, required this.stockTicker});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Adjust margin as needed
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                bottom: 10.0,
              ),
              child: Center(
                child: Column(
                  children: [
                    AppBar(
                      titleSpacing: 0,
                      title: Text('Stock Prices ($stockTicker)'),
                    ),
                    Expanded(
                      child: Chart(stockTicker: stockTicker),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
