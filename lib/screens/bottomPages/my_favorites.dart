import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:travleapp/repository/favorite.dart';

import '../../repository/cityname.dart';
import '../post.dart';

class myFavorites extends ConsumerStatefulWidget {
  const myFavorites({Key? key}) : super(key: key);

  @override
  ConsumerState<myFavorites> createState() => _myFavoritesState();
}

class _myFavoritesState extends ConsumerState<myFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
           ref.watch(favoriteProvider).favorites.length==0?  Center(
             child:Lottie.network("https://assets8.lottiefiles.com/packages/lf20_khnalzic.json"),
           ): ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ref.watch(favoriteProvider).favorites.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return post(index);
                            }));
                          },
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "images/city${ref.watch(favoriteProvider).favorites.elementAt(index) == 0 ? 1 : ref.watch(favoriteProvider).favorites.elementAt(index)}.jpg"),
                                    fit: BoxFit.cover,
                                    opacity: 0.8)),
                            child: Container(
                              padding:const EdgeInsets.all(15),
                              alignment: Alignment.topRight,
                              child: IconButton(
                                  onPressed: () {
                                    ref
                                        .watch(favoriteProvider)
                                        .DeleteLove(index);
                                  },
                                  icon:const Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent,
                                    size: 33,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ref.watch(cityProvider).city[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                              size: 20,
                            ),
                            Text(
                              "4.8",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }


}
