class RateApiModel {
  final double rate;
  final int count;

  RateApiModel({required this.rate, required this.count});
  factory RateApiModel.fromJson(Map<String, dynamic> json) {
    return RateApiModel(rate: (json['rate'] as num).toDouble(), count: json['count']);
  }
}
