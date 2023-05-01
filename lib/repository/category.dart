import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class categorys extends ChangeNotifier {
  var category = [
    'Anıtlar',
    'Akvaryumlar',
    'Şehir',
    'Doğa',
    'Plajlar',
    'Oteller'
  ];
}

final categoryProvider=ChangeNotifierProvider((ref) {
  return categorys();
});
