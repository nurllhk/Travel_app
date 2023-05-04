import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/Homebottom.dart';
import '../widgets/postbar.dart';
import '../widgets/postbottom.dart';

class post extends ConsumerWidget {
  final int index;
  const post(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("images/city${index+1}.jpg"), fit: BoxFit.cover,opacity: 0.8)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize( preferredSize: Size.fromHeight(90), child:PostBar(index),),
        bottomNavigationBar: postbottom(),
      ),
      
    );
  }
}
