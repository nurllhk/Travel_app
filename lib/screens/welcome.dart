import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:lottie/lottie.dart';

import 'home.dart';

class welcome extends StatelessWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.jpg"),
              fit: BoxFit.cover,
              opacity: 0.8)),
      child: SafeArea(
        child: Material(
          color: Colors.transparent,

          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text('NK', style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3
                  ),),
                  SizedBox(
                    height: 2,
                  ),
                  Text("Dünyayamıza Gel", style: TextStyle(

                    color: Colors.white.withOpacity(0.8),
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.3

                  ),),

                  SizedBox(height: 30,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return Home();
                      }));


                    },
                    child: Ink(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
                      child: Icon(
                        Icons.navigate_next_sharp,
                        color: Colors.black,
                        size: 23,

                      ),
                    ),
                  ),
                  SizedBox(height: 14,),
                  Lottie.network("https://lottie.host/1c2658cb-31fb-4932-bb26-cabb5a937b08/z0fmKcLdf6.json")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
