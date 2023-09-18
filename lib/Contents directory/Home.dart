import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MaterialApp(
      home: home(),
      debugShowCheckedModeBanner: false,
    ));

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  double appUsagePercentage = 0.0; // Initialize the percentage (20%)

  late Timer timer;

  @override
  void initState() {
    super.initState();

    // Start a timer to periodically update the percentage
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      updatePercentage();
    });
  }

  // Function to update the appUsagePercentage
  void updatePercentage() {
    setState(() {
      // Simulate an increase in usage, update the percentage accordingly
      appUsagePercentage += 0.01;
      if (appUsagePercentage > 1.0) {
        appUsagePercentage = 1.0; // Cap the percentage at 100%
      }
    });
  }

  double percentage = 0.2; // Initial percentage

  void increasePercentage() {
    // Increase the percentage (e.g., by 10%)
    setState(() {
      percentage += 0.1;
      if (percentage > 1.0) {
        percentage = 1.0; // Cap the percentage at 100%
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.deepPurple]),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: CircularPercentIndicator(
                          radius: 50,
                          circularStrokeCap: CircularStrokeCap.round,
                          lineWidth: 5,
                          progressColor: Colors.deepPurple,
                          backgroundColor: Colors.deepPurple.shade100,
                          percent:  appUsagePercentage,
                          center: Text(
                            '${(appUsagePercentage * 100).toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        )),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
