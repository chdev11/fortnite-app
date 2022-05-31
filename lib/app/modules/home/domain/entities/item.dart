import 'package:fortnite_app/app/modules/home/domain/entities/item_rarity.dart';

class Item {
  final String id;
  final String name;
  final String description;
  final String smallIcon;
  final String icon;
  final String? featured;
  final ItemRarity rarity;

  Item(
      {required this.id,
      required this.name,
      required this.description,
      required this.smallIcon,
      required this.icon,
      this.featured,
      required this.rarity});
}
