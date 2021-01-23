import 'package:covid19livedata/services/covid_service.dart';
import 'package:flutter/material.dart';
import 'package:covid19livedata/utilities/constants.dart';
import 'package:covid19livedata/screens/country_data.dart';
import 'package:covid19livedata/models/country_summary.dart';
import 'package:covid19livedata/screens/country_loading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


CovidService covidService = CovidService();
AsyncSnapshot snapshotVar;

String selectedCountry;
RefreshController _refreshController = RefreshController(initialRefresh: false);

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  Future<CountrySummaryModel> summaryList;

  void getSnapshot(snapshot) {
    snapshotVar = snapshot;
  }

  void changeValue(value, snapshot) {
    selectedCountry = value;
    summaryList = covidService.getCountrySummary(selectedCountry);
  }

  @override
  initState() {
    super.initState();
    selectedCountry = 'India';
    summaryList = covidService.getCountrySummary(selectedCountry);
  }

  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () async {
        setState(() {
          summaryList = covidService.getCountrySummary(selectedCountry);
        });
        _refreshController.refreshCompleted();
      },
      enablePullDown: true,
      header: WaterDropMaterialHeader(
          color: Colors.white, backgroundColor: Colors.teal.shade900),
      child: FutureBuilder(
        future: summaryList,
        builder: (context, snapshot) {
          getSnapshot(snapshot);
          if (snapshot.hasError)
            return Center(
                child: Text(
              "Error in Loading Data",
              style: TextStyle(fontSize: 20, color: Colors.red),
            ));
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CountryLoading();
            default:
              return !snapshot.hasData
                  ? Center(
                      child: Text(
                        "No Data Found",
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          height: 25.0,
                          width: double.infinity,
                          padding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 12),
                          child: Text(
                            'Select your Country',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 1),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kCardColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Color(0xFFE5E5E5),
                              )),
                          child: DropdownButton<String>(
                            value: selectedCountry,
                            isExpanded: true,
                            icon: Icon(Icons.expand_more),
                            iconSize: 40,
                            underline: Container(height: 0, width: 0),
                            elevation: 16,
                            dropdownColor: kCardColor,
                            onChanged: (String newValue) {
                              setState(() {
                                changeValue(newValue, snapshot);
                              });
                            },
                            items: kCountryList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 15.0, width: double.infinity),
                        FutureBuilder(
                          future: summaryList,
                          builder: (context, snapshot) {
                            if (snapshot.hasError)
                              return Center(
                                child: Text(
                                  "Error in Loading Data",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.red),
                                ),
                              );
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return CountryLoading();
                              default:
                                return !snapshot.hasData
                                    ? Center(
                                        child: Text(
                                          "No Data Found",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      )
                                    : CountryData(
                                        countrySummary: snapshot.data,
                                      );
                            }
                          },
                        ),
                      ],
                    );
          }
        },
      ),
    );
  }
}
