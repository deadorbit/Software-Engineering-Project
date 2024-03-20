import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:software_engineering_project/components/charts/chart.dart';

class ChartDisplay extends StatelessWidget {
  final String stockTicker;

  const ChartDisplay({super.key, required this.stockTicker});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0), // Adjust margin as needed
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          height: 500,
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Text(
                  stockTicker,
                  style: GoogleFonts.bodoniModa(
                    color: const Color.fromARGB(255, 59, 59, 61),
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Chart(stockTicker: stockTicker),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
