import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Homebottom extends StatelessWidget {
  const Homebottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        index: 2,
        items: [
          Icon(
            Icons.home_outlined,
            size: 30,
          ),
          Icon(
            Icons.favorite_outline,
            size: 30,
            color: Colors.redAccent,
          ),
          Icon(
            Icons.add_outlined,
            size: 30,
          ),
          Icon(
            Icons.location_on_outlined,
            size: 30,
          ),
          Icon(
            Icons.person_outline_rounded,
            size: 30,
          ),
        ]);
  }
}
