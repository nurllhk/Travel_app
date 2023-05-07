import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travleapp/repository/favorite.dart';

class PostBar extends ConsumerWidget {
  int index;

  PostBar(this.index, {Key? key}) : super(key: key);
  bool favori = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(20),
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 2)
                    ]),
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  size: 28,
                ),
              ),
            ),
          ),
          SafeArea(
            child: InkWell(
              onTap: () {
                if (ref.read(favoriteProvider).DoILove(index + 1)) {
                  ref.read(favoriteProvider).DeleteLoveshow(index + 1);
                } else {
                  ref.read(favoriteProvider).addFavori(index + 1);
                }
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 2)
                      ]),
                  child: ref.watch(favoriteProvider).DoILove(index + 1)
                      ?const Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          size: 28,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          size: 28,
                        )),
            ),
          ),
        ],
      ),
    );
  }
}
