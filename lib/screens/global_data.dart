import 'package:flutter/material.dart';
import 'package:covid19livedata/models/global_summary.dart';
//import 'package:timeago/timeago.dart' as timeago;
import 'package:covid19livedata/utilities/constants.dart';

double screenHeight;

class GlobalData extends StatelessWidget {
  final GlobalSummaryModel summary;
  final double height;
  GlobalData({@required this.summary, this.height});

  @override
  Widget build(BuildContext context) {
    screenHeight = height;
    return Column(
      children: [
        buildCard(
          label: 'Confirmed',
          todayCount: summary.newCases,
          totalCount: summary.totalCases,
          color: kConfirmedColor,
        ),
        SizedBox(height: 5),
        buildActiveCriticalCard(
          activeCount: summary.active,
          criticalCount: summary.critical,
          color: kActiveColor,
        ),
        SizedBox(height: 5),
        buildCard(
          label: 'Recovered',
          todayCount: summary.newRecovered,
          totalCount: summary.totalRecovered,
          color: kRecoveredColor,
        ),
        SizedBox(height: 5),
        buildCard(
          label: 'Death',
          todayCount: summary.newDeaths,
          totalCount: summary.totalDeaths,
          color: kDeathColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            'Statistics updates every 2-3 hrs',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildCard({String label, int totalCount, int todayCount, Color color}) {
  return Stack(
    children: [
      Container(
        height: screenHeight * kGlobalHeightRatio,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      totalCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Text(
                      todayCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildActiveCriticalCard(
    {int activeCount, int criticalCount, Color color}) {
  return Stack(
    children: [
      Container(
        height: screenHeight * kGlobalHeightRatio,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Active & Critical',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Active',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      activeCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Critical',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      criticalCount.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
