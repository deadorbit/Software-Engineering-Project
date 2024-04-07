import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:software_engineering_project/models/profit_helper.dart';

import '../service/controller.dart';

class PortfolioPage extends StatefulWidget {
  final String userId;
  final Map<String, double> dataMap;

  const PortfolioPage({
    super.key,
    required this.userId,
    required this.dataMap,
  });

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final databaseController = DataBase_Controller();
  double aTProfit = 0.0;
  double unrealisedProfit = 0.0;
  String bestStock = "";
  double bestPercentage = 0.0;
  String worstStock = "";
  double worstPercentage = 0.0;

  Map<String, double> trying = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  void initState() {
    super.initState();
    getAllTimeProfit();
    getUnrealisedProfit();
    getStockInfo();
  }

  void getAllTimeProfit() async {
    aTProfit = await databaseController.getAllTimeProfit(widget.userId);
    setState(() {});
  }

  void getUnrealisedProfit() async {
    unrealisedProfit =
        await databaseController.getUnrealisedProfit(widget.userId);
    setState(() {});
  }

  void getStockInfo() async {
    Map<String, double> stocks =
        await databaseController.getSTocksForPerformers(widget.userId);

    bestStock = stocks.keys.first;
    bestPercentage = stocks[bestStock]!;
    worstStock = stocks.keys.first;
    worstPercentage = stocks[worstStock]!;

    stocks.forEach((key, value) {
      if (value < worstPercentage) {
        worstStock = key;
        worstPercentage = value;
      }
      if (value > bestPercentage) {
        bestPercentage = value;
        bestStock = key;
      }
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Portfolio"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(
            children: [
              PieChart(
                dataMap: widget.dataMap,
                chartValuesOptions: ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: false,
                  decimalPlaces: 1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                          width: 125, // Set your desired width
                          height: 50,
                          child: Column(
                            children: [
                              Center(child: Text("All time profit")),
                              Center(
                                child: Text(
                                  "${aTProfit.toStringAsFixed(2)}\$",
                                  style: TextStyle(
                                      fontSize: 20, // Size of the text
                                      fontWeight:
                                          FontWeight.bold, // Make text bold
                                      color: aTProfit > 0
                                          ? Colors.blue
                                          : aTProfit < 0
                                              ? Colors.red
                                              : Colors.grey),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                          width: 125, // Set your desired width
                          height: 50,
                          child: Center(
                              child: Column(
                            children: [
                              Text("Unrealised Profit"),
                              Center(
                                child: Text(
                                  "${unrealisedProfit.toStringAsFixed(2)}\$",
                                  style: TextStyle(
                                      fontSize: 20, // Size of the text
                                      fontWeight:
                                          FontWeight.bold, // Make text bold
                                      color: unrealisedProfit > 0
                                          ? Colors.blue
                                          : aTProfit < 0
                                              ? Colors.red
                                              : Colors.grey),
                                ),
                              )
                            ],
                          ))),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                          width: 125, // Set your desired width
                          height: 50,
                          child: Center(
                              child: Column(
                            children: [
                              Text("Best Performer"),
                              Center(
                                child: Row(
                                  children: [
                                    Text(
                                      bestStock,
                                      style: TextStyle(
                                        fontSize: 20, // Size of the text
                                        fontWeight:
                                            FontWeight.bold, // Make text bold
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                        bestPercentage > 0
                                            ? " ↑${bestPercentage.toStringAsFixed(2)}%"
                                            : bestPercentage < 0
                                                ? " ↓${bestPercentage.toStringAsFixed(2)}%"
                                                : " ${bestPercentage.toStringAsFixed(2)}%",
                                        style: TextStyle(
                                            fontSize: 15, // Size of the text
                                            fontWeight: FontWeight
                                                .bold, // Make text bold
                                            color: bestPercentage > 0
                                                ? Colors.blue
                                                : aTProfit < 0
                                                    ? Colors.red
                                                    : Colors.grey)),
                                  ],
                                ),
                              )
                            ],
                          ))),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                          width: 125, // Set your desired width
                          height: 50,
                          child: Center(
                              child: Column(
                            children: [
                              Text("Worst Performer"),
                              Center(
                                child: Row(
                                  children: [
                                    Text(
                                      worstStock,
                                      style: TextStyle(
                                        fontSize: 20, // Size of the text
                                        fontWeight:
                                            FontWeight.bold, // Make text bold
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                        worstPercentage > 0
                                            ? " ↑${worstPercentage.toStringAsFixed(2)}%"
                                            : worstPercentage < 0
                                                ? " ↓${worstPercentage.toStringAsFixed(2)}%"
                                                : " ${worstPercentage.toStringAsFixed(2)}%",
                                        style: TextStyle(
                                            fontSize: 15, // Size of the text
                                            fontWeight: FontWeight
                                                .bold, // Make text bold
                                            color: worstPercentage > 0
                                                ? Colors.blue
                                                : aTProfit < 0
                                                    ? Colors.red
                                                    : Colors.grey)),
                                  ],
                                ),
                              )
                            ],
                          ))),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

Widget createCard(String text) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
    elevation: 5.0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: 120, // Set your desired width
        height: 50, // Set your desired height (optional)
        child: Center(child: Text(text)), // Centered text inside the SizedBox
      ),
    ),
  );
}
