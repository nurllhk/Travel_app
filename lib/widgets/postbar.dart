import 'package:flutter/material.dart';

class postbar extends StatefulWidget {
  postbar({Key? key}) : super(key: key);
  bool favori = false;

  @override
  State<postbar> createState() => _postbarState();
}

class _postbarState extends State<postbar> {
  @override
  Widget build(BuildContext context) {
    bool favori = true;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 2)
                    ]),
                child: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 28,
                ),
              ),
            ),
          ),
          SafeArea(
            child: InkWell(
              onTap: () {},
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (favori == false) {
                      favori = true;
                    } else {
                      favori = false;
                    }
                  });
                },
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 2)
                        ]),
                    child: Icon(
                      Icons.favorite_outline,
                      size: 28,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
