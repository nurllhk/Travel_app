import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class favori extends ChangeNotifier {
  var favorites = [0, 2, 3];

  void addFavori(add) {
    favorites.add(add);
  }
}

var favoriteProvider = ChangeNotifierProvider((ref) {
  return favori();
});
