import 'package:flutter/material.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/package.dart';
import 'package:fortnite_app/app/modules/home/presenter/ui/widgets/offer_widget.dart';
import 'package:fortnite_app/shared/utils/constants.dart';

class PackageCard extends StatelessWidget {
  final Package package;
  late Size size;

  PackageCard({Key? key, required this.package}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Image(
                image: const NetworkImage(vbuckIcon),
                width: size.height * 0.05,
                height: size.height * 0.05,
              ),
              SizedBox(width: size.width * 0.02),
              Text(
                '${package.finalPrice}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              package.finalPrice - package.regularPrice < 0
                  ? OfferWidget(
                      value: (package.regularPrice - package.finalPrice),
                    )
                  : Container()
            ],
          ),
          SizedBox(
            height: size.height * 0.25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              controller: ScrollController(),
              children: package.items
                  .map((e) => Padding(
                        padding: EdgeInsets.all(size.height * 0.02),
                        child: Column(
                          children: [
                            Image(
                              image: NetworkImage(e.icon),
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(height: size.height * 0.01),
                            Text(
                              e.name,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
