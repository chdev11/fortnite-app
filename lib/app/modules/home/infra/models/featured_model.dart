import 'dart:convert';

import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/infra/models/item_model.dart';

class FeaturedModel extends Featured {
  FeaturedModel(
      {required super.regularPrice,
      required super.finalPrice,
      required super.items});

  Map<String, dynamic> toMap() {
    return {
      'regularPrice': regularPrice,
      'finalPrice': finalPrice,
      'items': items.map((e) => (e as ItemModel).toMap())
    };
  }

  factory FeaturedModel.fromMap(Map source) {
    return FeaturedModel(
        regularPrice: source['regularPrice'],
        finalPrice: source['finalPrice'],
        items: (source['items'] as List)
            .map((e) => ItemModel.fromMap(e))
            .toList());
  }

  String toJson() => jsonEncode(toMap());

  factory FeaturedModel.fromJson(String source) =>
      FeaturedModel.fromMap(jsonDecode(source));
}
