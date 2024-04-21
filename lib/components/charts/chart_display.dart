import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
                left: 25.0,
                right: 25.0,
                bottom: 10.0,
              ),
              child: Center(
                child: Column(
                  children: [
                    AppBar(
                      titleSpacing: 0,
                      title: Text(
                        'Stock Prices ($stockTicker)',
                        style: GoogleFonts.bodoniModa(
                          color: const Color.fromARGB(255, 59, 59, 61),
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const Divider(
                      height: 2, // Adjust height as needed
                      thickness: 2, // Adjust thickness as needed
                      color: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      child: Text(
                        "Closing Prices (Daily)",
                        style: GoogleFonts.bodoniModa(
                          color: const Color.fromARGB(255, 59, 59, 61),
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Chart(stockTicker: stockTicker),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: const ContinuousRectangleBorder(),
                                      elevation: 2.0),
                                  child: const Text('Week'))),
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: const ContinuousRectangleBorder(),
                                      elevation: 0,
                                      backgroundColor: Colors.deepPurple[100]),
                                  child: const Text('Month'))),
                          Expanded(
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: const ContinuousRectangleBorder(),
                                      elevation: 2.0),
                                  child: const Text('Year'))),
                        ],
                      ),
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
