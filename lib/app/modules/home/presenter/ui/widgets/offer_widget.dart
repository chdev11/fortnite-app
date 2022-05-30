import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  final int value;
  const OfferWidget({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text(
        'Desconto $value',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
