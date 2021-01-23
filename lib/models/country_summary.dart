class CountrySummaryModel {
  final String country;
  final int confirmed;
  final int todayCases;
  final int death;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;

  CountrySummaryModel(this.country, this.confirmed,this.todayCases, this.death,this.todayDeaths,
      this.recovered, this.todayRecovered, this.active, this.critical);

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json) {
    return CountrySummaryModel(
      json["country"],
      json["cases"],
      json["todayCases"],
      json["deaths"],
      json["todayDeaths"],
      json["recovered"],
      json["todayRecovered"],
      json["active"],
      json["critical"],
    );
  }
}
