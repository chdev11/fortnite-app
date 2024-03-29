import 'package:fortnite_app/app/modules/home/domain/entities/bundle.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/item.dart';

class Featured {
  final int regularPrice;
  final int finalPrice;
  final List<Item> items;
  final String? bannerValue;
  final Bundle? bundle;
  final List<String> bundleBackgroundImages;

  Featured(
      {required this.regularPrice,
      required this.finalPrice,
      required this.items,
      this.bannerValue,
      this.bundle,
      this.bundleBackgroundImages = const []});
}
