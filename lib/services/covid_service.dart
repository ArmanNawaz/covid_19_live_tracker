import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covid19livedata/models/country_summary.dart';
import 'package:covid19livedata/models/global_summary.dart';

class CovidService {
  Future<GlobalSummaryModel> getGlobalSummary() async {
    final data = await http.Client().get("https://disease.sh/v3/covid-19/all");

    if (data.statusCode != 200)
      // throw Exception();
      print(data.statusCode);

    GlobalSummaryModel summary =
        new GlobalSummaryModel.fromJson(json.decode(data.body));

    return summary;
  }

  Future<CountrySummaryModel> getCountrySummary(String country) async {
    final data = await http.Client()
        .get("https://disease.sh/v3/covid-19/countries/$country?yesterday=true");

    if (data.statusCode != 200) throw Exception('Data not Found');

    CountrySummaryModel countrySummary = new CountrySummaryModel.fromJson(json.decode(data.body));

    return countrySummary;
  }

  /*Future<List<CountryModel>> getCountryList() async {
    final data =
        await http.Client().get("https://disease.sh/v3/covid-19/countries");

    if (data.statusCode != 200) throw Exception();

    List<CountryModel> countries = (json.decode(data.body) as List)
        .map((item) => new CountryModel.fromJson(item))
        .toList();

    return countries;
  }*/
}
