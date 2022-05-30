import 'dart:convert';

import 'package:fortnite_app/app/modules/home/domain/entities/item.dart';

class ItemModel extends Item {
  ItemModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.smallIcon,
      required super.icon});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'smallIcon': smallIcon,
      'icon': icon
    };
  }

  factory ItemModel.fromMap(Map source) {
    return ItemModel(
        id: source['id'],
        name: source['name'],
        description: source['description'],
        smallIcon: source['images']['smallIcon'],
        icon: source['images']['icon']);
  }

  String toJson() => jsonEncode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(jsonDecode(source));
}
