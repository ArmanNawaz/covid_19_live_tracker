class GlobalSummaryModel {
  final int totalCases;
  final int newCases;
  final int totalDeaths;
  final int newDeaths;
  final int totalRecovered;
  final int newRecovered;
  final int active;
  final int critical;

  GlobalSummaryModel(this.totalCases, this.newCases, this.totalDeaths, this.newDeaths, this.totalRecovered, this.newRecovered,
      this.active, this.critical);

  factory GlobalSummaryModel.fromJson(Map<String, dynamic> json) {
    return GlobalSummaryModel(
     json['cases'],
     json['todayCases'],
     json['deaths'],
     json['todayDeaths'],
     json['recovered'],
     json['todayRecovered'],
     json['active'],
     json['critical'],
    );
  }
}
