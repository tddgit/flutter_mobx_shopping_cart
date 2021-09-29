import 'package:flutter/widgets.dart';
import '/shared/utils/app_variables.dart';

@immutable
class Product {
  const Product({
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.imageURL,
  });

  final String name;
  final String description;
  final Category category;
  final double price;
  final String imageURL;

  @override
  // ignore: avoid_renaming_method_parameters
  bool operator ==(Object o) => o is Product && o.name == name;

  @override
  int get hashCode => name.hashCode;
}
