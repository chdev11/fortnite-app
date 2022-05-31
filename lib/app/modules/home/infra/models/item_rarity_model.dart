import 'dart:convert';

import 'package:fortnite_app/app/modules/home/domain/entities/item_rarity.dart';

class ItemRarityModel extends ItemRarity {
  ItemRarityModel({required super.value, required super.displayValue});

  Map<String, dynamic> toMap() {
    return {'value': value, 'displayValue': displayValue};
  }

  factory ItemRarityModel.fromMap(Map source) {
    return ItemRarityModel(
        value: source['value'], displayValue: source['displayValue']);
  }

  String toJson() => jsonEncode(toMap());

  factory ItemRarityModel.fromJson(String source) =>
      ItemRarityModel.fromMap(jsonDecode(source));
}
