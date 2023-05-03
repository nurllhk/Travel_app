import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class cityName extends ChangeNotifier{

  var city =['Venezuella', 'Amerika','Fransa', 'İran', 'İngiltere','İsviçre'];


}

final cityProvider = ChangeNotifierProvider((ref) => cityName());
