import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final double discountPercentage;
  @HiveField(6)
  final double rating;
  @HiveField(7)
  final int stock;
  @HiveField(8)
  final String brand;
  @HiveField(9)
  final String sku;
  @HiveField(10)
  final String availabilityStatus;
  @HiveField(11)
  final List<ReviewModel> reviews;
  @HiveField(12)
  final String returnPolicy;
  @HiveField(13)
  final Meta meta;
  @HiveField(14)
  final List<String> images;
  @HiveField(15)
  final String thumbnail;
  @HiveField(16)
  final int? quantity; 

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.sku,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.meta,
    required this.images,
    required this.thumbnail,
    this.quantity, 
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      discountPercentage: (json['discountPercentage'] ?? 0.0).toDouble(),
      rating: (json['rating'] ?? 0.0).toDouble(),
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? '',
      sku: json['sku'] ?? '',
      availabilityStatus: json['availabilityStatus'] ?? '',
      reviews: (json['reviews'] as List? ?? [])
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      returnPolicy: json['returnPolicy'] ?? '',
      meta: Meta.fromJson(json['meta'] ?? {}),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? '',
      quantity: json['quantity'],
    );
  }
}

@HiveType(typeId: 1)
class ReviewModel {
  @HiveField(0)
  final double rating;
  @HiveField(1)
  final String comment;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final String reviewerName;
  @HiveField(4)
  final String reviewerEmail;

  ReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: (json['rating'] ?? 0.0).toDouble(),
      comment: json['comment'] ?? '',
      date: json['date'] ?? '',
      reviewerName: json['reviewerName'] ?? '',
      reviewerEmail: json['reviewerEmail'] ?? '',
    );
  }
}

@HiveType(typeId: 2)
class Meta {
  @HiveField(0)
  final String barcode;
  @HiveField(1)
  final String qrCode;

  Meta({
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      barcode: json['barcode'] ?? '',
      qrCode: json['qrCode'] ?? '',
    );
  }
}
