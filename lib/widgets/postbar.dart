import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travleapp/repository/favorite.dart';

class postbar extends ConsumerWidget {
  int index;
  postbar(this.index, {Key? key}) : super(key: key);
  bool favori = false;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
              onTap: () {
                if(ref.read(favoriteProvider).favorites.contains(index)){
                  ref.read(favoriteProvider).favorites.removeAt(index);
                }else{

                  ref.read(favoriteProvider).favorites.add(index);
                }


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
                      ref.watch(favoriteProvider).favorites.contains(index) ? Icons.favorite:Icons.favorite_outline,
                      size: 28,
                    )),

            ),
          ),
        ],
      ),
    );
  }
}
