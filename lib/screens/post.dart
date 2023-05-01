import 'package:flutter/material.dart';

import '../widgets/Homebottom.dart';
import '../widgets/postbar.dart';
import '../widgets/postbottom.dart';

class post extends StatelessWidget {
  const post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("images/city2.jpg"), fit: BoxFit.cover,opacity: 0.8)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize( preferredSize: Size.fromHeight(90), child:postbar(),),
        bottomNavigationBar: postbottom(),
      ),
      
    );
  }
}
