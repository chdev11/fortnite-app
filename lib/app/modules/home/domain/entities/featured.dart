import 'package:fortnite_app/app/modules/home/domain/entities/item.dart';

class Featured {
  final int regularPrice;
  final int finalPrice;
  final List<Item> items;

  Featured(
      {required this.regularPrice,
      required this.finalPrice,
      required this.items});
}
