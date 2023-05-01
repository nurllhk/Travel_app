import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travleapp/repository/category.dart';
import 'package:travleapp/screens/post.dart';

import '../widgets/Homebottom.dart';
import '../widgets/home_app_bar.dart';

class home extends ConsumerWidget {

  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
          child: homeappbar(), preferredSize: Size.fromHeight(90.0)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 200,
                          child: ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context){

                                    return post();
                                  }));
                                },
                                child: Container(
                                  width: 160,
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(left: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/city${index + 1}.jpg"),
                                          fit: BoxFit.cover,
                                          opacity: 0.8)),
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.bookmark_add_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(), // top -- bottom
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "Şehir İsmi",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        for(int x = 0; x < 6; x++)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.black26, blurRadius: 5)
                              ],
                            ),
                            child: Text(
                              ref
                                  .watch(categoryProvider)
                                  .category[x],
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    shrinkWrap: true,


                    itemBuilder: (BuildContext context, int index) {
                      return Padding(padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context){

  return post();
}));

                              },
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(image: AssetImage("images/city${index+1}.jpg"), fit: BoxFit.cover,opacity: 0.8)

                                ),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 10), child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Şehir İsmi", style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),),


                              ],
                            ),),
                            SizedBox(height: 6,),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amberAccent,size: 20,),Text("4.8", style: TextStyle(

                                  fontWeight: FontWeight.w500

                                ),)
                              ],
                            )
                          ],
                        ),

                      );
                    })
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:Homebottom() ,
    );
  }
}
