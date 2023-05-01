import 'package:flutter/material.dart';

class homeappbar extends StatelessWidget {
  const homeappbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
              child: InkWell(

                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(10),

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(12),

                  ),
                  child: Icon(Icons.sort_rounded,size: 38,),
                ),

              ),

          ),
          SafeArea(
            child: Row(
              children: [
                Icon(Icons.location_pin,color: Color(0xFFF65050),),
                Text("Diyarbakır, TR", style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
          )
        ],

      ),
    );
  }
}
