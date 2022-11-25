import 'package:flutter/material.dart';

class Product {
  int? id;
  String? title;
  String? price;
  String? description;
  String? image;
  int? quantity;
  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> obj) {
    return Product(
      id: obj['id'],
      title: obj['title'],
      price: obj['price'].toString(),
      description: obj['description'],
      image: obj['image'],
    );
  }
}
