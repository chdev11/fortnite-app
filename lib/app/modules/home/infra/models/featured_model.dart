import 'dart:convert';

import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/infra/models/bundle_model.dart';
import 'package:fortnite_app/app/modules/home/infra/models/item_model.dart';

class FeaturedModel extends Featured {
  FeaturedModel(
      {required super.regularPrice,
      required super.finalPrice,
      required super.items,
      required super.bannerValue,
      required super.bundle,
      required super.bundleBackgroundImages});

  Map<String, dynamic> toMap() {
    return {
      'regularPrice': regularPrice,
      'finalPrice': finalPrice,
      'items': items.map((e) => (e as ItemModel).toMap()),
      'banner': bannerValue != null ? {'value': bannerValue} : null,
      'bundle': bundle,
      'bundleBackgroundImage': bundleBackgroundImages
    };
  }

  factory FeaturedModel.fromMap(Map source) {
    return FeaturedModel(
      regularPrice: source['regularPrice'],
      finalPrice: source['finalPrice'],
      items:
          (source['items'] as List).map((e) => ItemModel.fromMap(e)).toList(),
      bannerValue: source['banner'] != null ? source['banner']['value'] : null,
      bundle: source['bundle'] != null
          ? BundleModel.fromMap(source['bundle'])
          : null,
      bundleBackgroundImages:
          (source['newDisplayAsset']['materialInstances'] as List)
              .map((e) => (e['images']['Background'] as String))
              .toList(),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory FeaturedModel.fromJson(String source) =>
      FeaturedModel.fromMap(jsonDecode(source));
}
