import 'dart:convert';

import 'package:fortnite_app/app/modules/home/domain/entities/item.dart';
import 'package:fortnite_app/app/modules/home/infra/models/item_rarity_model.dart';

class ItemModel extends Item {
  ItemModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.smallIcon,
      required super.icon,
      super.featured,
      required super.rarity});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'smallIcon': smallIcon,
      'icon': icon,
      'featured': featured,
      'rarity': (rarity as ItemRarityModel).toMap()
    };
  }

  factory ItemModel.fromMap(Map source) {
    return ItemModel(
        id: source['id'],
        name: source['name'],
        description: source['description'],
        smallIcon: source['images']['smallIcon'],
        icon: source['images']['icon'],
        featured: source['images']['featured'],
        rarity: ItemRarityModel.fromMap(source['rarity']));
  }

  String toJson() => jsonEncode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(jsonDecode(source));
}
