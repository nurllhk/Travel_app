import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travleapp/repository/category.dart';
import 'package:travleapp/repository/cityname.dart';
import 'package:travleapp/repository/favorite.dart';
import 'package:travleapp/screens/post.dart';

import '../widgets/Homebottom.dart';
import '../widgets/home_app_bar.dart';
import 'bottomPages/add_city.dart';
import 'bottomPages/location.dart';
import 'bottomPages/my_favorites.dart';
import 'bottomPages/my_profile.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  var currunindex;
  var pagelist = [
    const firstpage(),
    const myFavorites(),
    const addCity(),
    const location(),
    const MyProfile(),
  ];

/*
*   static get city => cityName();

  static get favory => favori();

  static get category => categorys();*/

  // firstpage(city: city, favory: favory, category: category)

  @override
  Widget build(BuildContext context) {
    final city = ref.watch(cityProvider);
    final favory = ref.watch(favoriteProvider);
    final category = ref.watch(categoryProvider);

    return Scaffold(
      appBar: currunindex == 3 || currunindex == 4 || currunindex == 2
          ? null
          : const PreferredSize(
              preferredSize: Size.fromHeight(90.0), child: homeappbar()),
      body: pagelist[currunindex == null ? 0 : currunindex],
      bottomNavigationBar: CurvedNavigationBar(
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
            color: Colors.lightGreen,
            size: 30,
          ),
          Icon(
            Icons.person_outline_rounded,
            size: 30,
          ),
        ],
        onTap: (int index) {
          setState(() {
            currunindex = index;

          });
        },
      ),
    );
  }
}

class firstpage extends ConsumerStatefulWidget {
  const firstpage({super.key});

  @override
  ConsumerState<firstpage> createState() => _firstpageState();
}

class _firstpageState extends ConsumerState<firstpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: ref.watch(cityProvider).city.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return post(index);
                            }));
                          },
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(left: 15),
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
                                    ref
                                            .watch(favoriteProvider)
                                            .DoILove(index + 1)
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(), // top -- bottom
                                Container(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    ref.watch(cityProvider).city[index],
                                    style: const TextStyle(
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
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      for (int x = 0; x < 6; x++)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(color: Colors.black26, blurRadius: 5)
                            ],
                          ),
                          child: Text(
                            ref.watch(categoryProvider).category[x],
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                        )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: ref.watch(cityProvider).city.length,
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
                                          "images/city${index + 1}.jpg"),
                                      fit: BoxFit.cover,
                                      opacity: 0.8)),
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
      ),
    );
  }
}
