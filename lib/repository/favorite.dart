import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class favori extends ChangeNotifier {
  var favorites = [0, 2, 3];

  void addFavori(add) {
    favorites.add(add);
    notifyListeners();
  }

  DoILove(int index) {
    return favorites.contains(index);
  }

  void DeleteLove(int delete) {
   int del= favorites.elementAt(delete);
   favorites.remove(del);
    notifyListeners();
  }

  void DeleteLoveshow(int delshow){
    favorites.remove(delshow);
    notifyListeners();
  }


}

var favoriteProvider = ChangeNotifierProvider((ref) {
  return favori();
});
