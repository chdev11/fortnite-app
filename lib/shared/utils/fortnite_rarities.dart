import 'package:flutter/material.dart';

List<Color> getRarityColorsByValue(String value) {
  List<Color> colors = [];
  switch (value) {
    case 'handmade':
      colors = [Colors.white];
      break;
    case 'common':
      colors = [Colors.grey, Colors.grey.shade900];
      break;
    case 'uncommon':
      colors = [Colors.green, Colors.green.shade900];
      break;
    case 'rare':
      colors = [Colors.blue, Colors.blue.shade900];
      break;
    case 'epic':
      colors = [Colors.purple, Colors.purple.shade900];
      break;
    case 'legendary':
      colors = [Colors.orange, const Color.fromARGB(255, 179, 62, 0)];
      break;
    case 'mythic':
      colors = [
        const Color.fromARGB(255, 255, 217, 0),
        const Color.fromARGB(255, 105, 90, 4)
      ];
      break;
    case 'exotic':
      colors = [Colors.cyanAccent, Colors.cyanAccent.shade700];
      break;
    case 'transcendent':
      colors = [Colors.redAccent, Colors.redAccent.shade700];
      break;
    case 'marvel':
      colors = [Colors.red.shade600, Colors.red.shade900];
      break;
    case 'dark':
      colors = [
        const Color.fromARGB(255, 255, 0, 255),
        const Color.fromARGB(255, 134, 3, 134)
      ];
      break;
    case 'dc':
      colors = [Colors.blueGrey, Colors.blueGrey.shade900];
      break;
    case 'icon':
      colors = [Colors.cyan, Colors.cyan.shade900];
      break;
    case 'frozen':
      colors = [Colors.blue.shade400, Colors.blue.shade900];
      break;
    case 'lava':
      colors = [Colors.orange.shade600, Colors.orange.shade800];
      break;
    case 'starwars':
      colors = [Colors.blue.shade700, Colors.blue.shade900];
      break;
    case 'shadow':
      colors = [Colors.black26, Colors.black];
      break;
    case 'slurp':
      colors = [Colors.cyan.shade600, Colors.cyan.shade800];
      break;
    case 'gaminglegends':
      colors = [Colors.indigo, Colors.indigo.shade900];
      break;
    default:
      colors = [Colors.grey, Colors.grey.shade900];
      break;
  }
  return colors;
}
