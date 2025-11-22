import 'package:music_app/models/rate_api_model.dart';

class ProductApiModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RateApiModel rating;

  ProductApiModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  factory ProductApiModel.fromJson(Map<String, dynamic> json) {
    return ProductApiModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      price: (json['price'] ?? 0).toDouble(),
      description: json['description'] ?? "",
      category: json['category'] ?? "",
      image: json['image'] ?? "",
      rating: json['rating'] != null
          ? RateApiModel.fromJson(json['rating'])
          : RateApiModel(rate: 0.0, count: 0),
    );
  }
}
