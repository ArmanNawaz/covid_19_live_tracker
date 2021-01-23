import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19livedata/utilities/constants.dart';
import 'package:covid19livedata/screens/country_page.dart';
import 'package:covid19livedata/screens/global_page.dart';
import 'package:covid19livedata/screens/navigation_option.dart';

enum NavigationStatus { GLOBAL, COUNTRY }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NavigationStatus navigationStatus = NavigationStatus.COUNTRY;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'COVID-19 Live Tracker',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kCardColor,
        elevation: 20.0,
        leading: Icon(
          Icons.track_changes,
          color: Colors.orangeAccent,
          size: 35.0,
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kCardColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child: AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: navigationStatus == NavigationStatus.GLOBAL
                    ? Global()
                    : CountryPage(),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NavigationOption(
                  title: "Country",
                  selected: navigationStatus == NavigationStatus.COUNTRY,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.COUNTRY;
                    });
                  },
                ),
                NavigationOption(
                  title: "Global",
                  selected: navigationStatus == NavigationStatus.GLOBAL,
                  onSelected: () {
                    setState(() {
                      navigationStatus = NavigationStatus.GLOBAL;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
