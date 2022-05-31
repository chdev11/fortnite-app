import 'dart:convert';

import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/infra/models/bundle_model.dart';
import 'package:fortnite_app/app/modules/home/infra/models/item_model.dart';

class FeaturedModel extends Featured {
  FeaturedModel(
      {required super.regularPrice,
      required super.finalPrice,
      required super.items,
      super.bundle});

  Map<String, dynamic> toMap() {
    return {
      'regularPrice': regularPrice,
      'finalPrice': finalPrice,
      'items': items.map((e) => (e as ItemModel).toMap()),
      'bundle': bundle
    };
  }

  factory FeaturedModel.fromMap(Map source) {
    return FeaturedModel(
      regularPrice: source['regularPrice'],
      finalPrice: source['finalPrice'],
      items:
          (source['items'] as List).map((e) => ItemModel.fromMap(e)).toList(),
      bundle: source['bundle'] != null
          ? BundleModel.fromMap(source['bundle'])
          : null,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory FeaturedModel.fromJson(String source) =>
      FeaturedModel.fromMap(jsonDecode(source));
}
