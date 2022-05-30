import 'package:fortnite_app/app/modules/home/domain/entities/item.dart';

class Package {
  final int regularPrice;
  final int finalPrice;
  final List<Item> items;

  Package(
      {required this.regularPrice,
      required this.finalPrice,
      required this.items});
}
