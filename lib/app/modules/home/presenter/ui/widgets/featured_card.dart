import 'package:flutter/material.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/presenter/ui/widgets/offer_widget.dart';
import 'package:fortnite_app/shared/utils/constants.dart';
import 'package:fortnite_app/shared/utils/fortnite_rarities.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedCard extends StatelessWidget {
  final Featured featured;
  late Size size;

  FeaturedCard({Key? key, required this.featured}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          children: [
            Image(
              image: const NetworkImage(vbuckIcon),
              width: size.height * 0.07,
              height: size.height * 0.07,
            ),
            SizedBox(width: size.width * 0.02),
            Text(
              '${featured.finalPrice}',
              style: TextStyle(fontSize: size.height * 0.035),
            ),
            const Spacer(),
            featured.finalPrice - featured.regularPrice < 0
                ? OfferWidget(
                    value: (featured.regularPrice - featured.finalPrice),
                  )
                : Container()
          ],
        ),
        SizedBox(
          height: size.height * 0.4,
          child: Align(
            alignment: Alignment.topLeft,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              controller: ScrollController(),
              children: featured.items
                  .map((e) => Padding(
                        padding: EdgeInsets.only(left: size.height * 0.01),
                        child: Container(
                          width: size.height * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      getRarityColorsByValue(e.rarity.value)[1]
                                          .withAlpha(80),
                                  width: size.height * 0.005,
                                  style: BorderStyle.solid),
                              gradient: RadialGradient(
                                radius: .8,
                                colors: getRarityColorsByValue(e.rarity.value),
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: NetworkImage(e.featured ?? e.icon),
                                width: size.height * 0.3,
                                height: size.height * 0.3,
                              ),
                              SizedBox(height: size.width * 0.005),
                              Expanded(
                                child: Container(
                                  width: size.width,
                                  color: Colors.black.withOpacity(.5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: size.height * 0.03),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.height * 0.01,
                                            right: size.height * 0.01),
                                        child: Text(
                                          e.description,
                                          style: TextStyle(
                                              color: Colors.white,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: size.height * 0.02),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
