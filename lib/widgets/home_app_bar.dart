import 'package:flutter/material.dart';

class homeappbar extends StatefulWidget {

  const homeappbar( {Key? key}) : super(key: key);

  @override
  State<homeappbar> createState() => _homeappbarState();
}

class _homeappbarState extends State<homeappbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(
            child: InkWell(

              onTap: (){},
              child: Container(
                padding:const EdgeInsets.all(10),

                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),

                ),
                child:const  Icon(Icons.sort_rounded,size: 38,),
              ),

            ),

          ),
          SafeArea(
            child: Row(
              children: const [
                Icon(Icons.location_pin,color: Color(0xFFF65050),),
                Text("İstanbul, TR", style: TextStyle(
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
