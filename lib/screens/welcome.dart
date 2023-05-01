import 'package:flutter/material.dart';

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
                Text("Dünyaya Gel", style: TextStyle(

                  color: Colors.white.withOpacity(0.8),
                  fontSize: 35,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.3

                ),),
                SizedBox(height: 12,),
                Text("Lorem Ipsum is simply dummy text of "
                    "the printing and typesetting industry. Lorem Ipsum "
                    "has been the industry's standard dummy text ever since the 15"
                    "00s, when an unknown printer took a galley of type and scrambled it"
                 , style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                  letterSpacing: 1.3
                ),
                 ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return home();
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
