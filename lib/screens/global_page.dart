import 'package:flutter/material.dart';
import 'package:covid19livedata/models/global_summary.dart';
import 'package:covid19livedata/services/covid_service.dart';
import 'package:covid19livedata/screens/global_loading.dart';
import 'package:covid19livedata/screens/global_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

CovidService covidService = CovidService();
Size size;
RefreshController _refreshController = RefreshController(initialRefresh: false);

class Global extends StatefulWidget {
  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  Future<GlobalSummaryModel> summary;
  @override
  void initState() {
    super.initState();

    summary = covidService.getGlobalSummary();
  }

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: () async {
        setState(() {
          summary = covidService.getGlobalSummary();
        });
        _refreshController.refreshCompleted();
      },
      enablePullDown: true,
      header: WaterDropMaterialHeader(
          color: Colors.white, backgroundColor: Colors.teal.shade900),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Global COVID-19 Cases',
              style: TextStyle(fontSize: 23.0, color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          FutureBuilder(
            future: summary,
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Center(
                  child: Text(
                    "Error in Loading Data",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.red.shade500,
                    ),
                  ),
                );
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return GlobalLoading();
                default:
                  return !snapshot.hasData
                      ? Center(
                          child: Text("No Data Found"),
                        )
                      : GlobalData(
                          summary: snapshot.data,
                          height: size.height,
                        );
              }
            },
          ),
        ],
      ),
    );
  }
}
