import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  final int value;
  const OfferWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(
        '$value OFF',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
