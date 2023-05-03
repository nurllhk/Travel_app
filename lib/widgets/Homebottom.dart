import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';


class Homebottom extends StatefulWidget {
   
  const Homebottom(int currunindex,  {Key? key}) : super(key: key);

  @override
  State<Homebottom> createState() => HomebottomState();
}

class HomebottomState extends State<Homebottom> {


  int currunindex=2;
  @override
  Widget build(BuildContext context) {

    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: 2,
      items: const [
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
      ],
      onTap: (int index) {

        setState(() {
          currunindex=index;
          
        });
      },
    );
  }
}
