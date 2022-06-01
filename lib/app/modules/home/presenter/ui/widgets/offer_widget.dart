import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  final String text;
  const OfferWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Colors.red.shade900, Colors.redAccent],
      )),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.006),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.height * 0.035),
        ),
      ),
    );
  }
}
