// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Product {
     final String title;
     final int price; 
     final String category;
     final String description;
     final String image;

  Product({required this.title, required this.price, required this.category, required this.description, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'price': price,
      'category': category,
      'description': description,
      'image': image,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      title: map['title'] as String,
      price: map['price'] as int,
      category: map['category'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
