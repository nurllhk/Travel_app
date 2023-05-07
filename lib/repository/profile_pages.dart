import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePages extends ChangeNotifier{

  var pages =['Hareketlerim','Yardım & İletişim','Güvenlik','Ayarlar','Çıkış'];

}

final pagesProvider =ChangeNotifierProvider((ref) => ProfilePages());