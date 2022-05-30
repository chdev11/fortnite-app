import 'dart:convert';

import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:fortnite_app/app/modules/home/infra/models/item_model.dart';

class PackageModel extends Package {
  PackageModel(
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

  factory PackageModel.fromMap(Map source) {
    return PackageModel(
        regularPrice: source['regularPrice'],
        finalPrice: source['finalPrice'],
        items: (source['items'] as List)
            .map((e) => ItemModel.fromMap(e))
            .toList());
  }

  String toJson() => jsonEncode(toMap());

  factory PackageModel.fromJson(String source) =>
      PackageModel.fromMap(jsonDecode(source));
}
