import 'package:flutter/material.dart';
import 'package:fortnite_app/app/modules/home/domain/entities/item.dart';
import 'package:fortnite_app/shared/utils/fortnite_rarities.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  late Size size;

  ItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(left: size.height * 0.01),
      child: Container(
        width: size.height * 0.3,
        decoration: BoxDecoration(
            border: Border.all(
                color:
                    getRarityColorsByValue(item.rarity.value)[1].withAlpha(80),
                width: size.height * 0.005,
                style: BorderStyle.solid),
            borderRadius: BorderRadius.all(Radius.circular(size.height * 0.04)),
            gradient: RadialGradient(
              radius: .8,
              colors: getRarityColorsByValue(item.rarity.value),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(item.featured ?? item.icon),
              width: size.height * 0.3,
              height: size.height * 0.3,
            ),
            SizedBox(height: size.width * 0.005),
            Expanded(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.5),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(size.height * 0.04),
                      bottomRight: Radius.circular(size.height * 0.04)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis,
                          fontSize: size.height * 0.03),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.height * 0.01, right: size.height * 0.01),
                      child: Text(
                        item.description,
                        style: TextStyle(
                            fontFamily: GoogleFonts.lato().fontFamily,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis,
                            fontSize: size.height * 0.022),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
