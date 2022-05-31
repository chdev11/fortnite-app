import 'dart:convert';

import 'package:fortnite_app/app/modules/home/domain/entities/bundle.dart';

class BundleModel extends Bundle {
  BundleModel({required super.name, required super.info, required super.image});

  Map<String, dynamic> toMap() {
    return {'name': name, 'info': info, 'image': image};
  }

  factory BundleModel.fromMap(Map source) {
    return BundleModel(
        name: source['name'], info: source['info'], image: source['image']);
  }

  String toJson() => jsonEncode(toMap());

  factory BundleModel.fromJson(String source) =>
      BundleModel.fromMap(jsonDecode(source));
}
