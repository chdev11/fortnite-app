import 'package:flutter/material.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/featured.dart';
import 'package:fortnite_app/app/modules/home/presenter/ui/widgets/item_card.dart';
import 'package:fortnite_app/app/modules/home/presenter/ui/widgets/offer_widget.dart';
import 'package:fortnite_app/shared/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturedCard extends StatefulWidget {
  final Featured featured;

  const FeaturedCard({Key? key, required this.featured}) : super(key: key);

  @override
  State<FeaturedCard> createState() => _FeaturedCardState();
}

class _FeaturedCardState extends State<FeaturedCard> {
  late Size size;
  late int currentImageIndex;

  @override
  void initState() {
    if (widget.featured.bundleBackgroundImages.isNotEmpty) {
      currentImageIndex = 0;
      () async {
        while (true) {
          await Future.delayed(const Duration(seconds: 10));
          if (currentImageIndex ==
              widget.featured.bundleBackgroundImages.length - 1) {
            currentImageIndex = 0;
          } else {
            currentImageIndex++;
          }
          if (mounted) setState(() {});
        }
      }();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Column(
      children: [
        widget.featured.bundle != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image(
                          image: NetworkImage(widget.featured
                              .bundleBackgroundImages[currentImageIndex]),
                          width: size.width,
                          height: size.width),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.06,
                                color: Colors.black.withOpacity(.6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        child: Text(
                                      widget.featured.bundle!.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: size.height * 0.04),
                                    )),
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width,
                                height: size.height * 0.04,
                                color: Colors.black,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${widget.featured.finalPrice}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontStyle: FontStyle.italic,
                                          fontSize: size.height * 0.03),
                                    ),
                                    RotationTransition(
                                      turns: const AlwaysStoppedAnimation(
                                          15 / 360),
                                      child: Image(
                                        image: const NetworkImage(vbuckIcon),
                                        width: size.height * 0.07,
                                        height: size.height * 0.07,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: widget.featured.bannerValue != null
                              ? OfferWidget(
                                  text: widget.featured.bannerValue!,
                                )
                              : Container()),
                    ],
                  )
                ],
              )
            : Container(),
        widget.featured.bundle == null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: const NetworkImage(vbuckIcon),
                    width: size.height * 0.07,
                    height: size.height * 0.07,
                  ),
                  SizedBox(width: size.width * 0.02),
                  Text(
                    '${widget.featured.finalPrice}',
                    style: TextStyle(fontSize: size.height * 0.035),
                  ),
                  const Spacer(),
                  widget.featured.bannerValue != null
                      ? OfferWidget(
                          text: widget.featured.bannerValue!,
                        )
                      : Container()
                ],
              )
            : SizedBox(height: size.height * 0.01),
        SizedBox(
          height: size.height * 0.4,
          child: Align(
            alignment: Alignment.topLeft,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              controller: ScrollController(),
              children:
                  widget.featured.items.map((e) => ItemCard(item: e)).toList(),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.02),
        const Divider(
          color: Colors.black,
        )
      ],
    );
  }
}
