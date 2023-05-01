import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class favori extends ChangeNotifier {
  var favorites = [

  ];
  void addFavori(add){
    favorites.add(add);

  }
}

final favoriteProvider=ChangeNotifierProvider((ref) {
  return favori();
});
