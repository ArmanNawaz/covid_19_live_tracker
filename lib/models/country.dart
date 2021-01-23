class CountryModel {
  final String country;

  CountryModel(this.country);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      json["country"],
    );
  }
}
