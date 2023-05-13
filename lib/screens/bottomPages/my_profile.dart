import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:travleapp/repository/profile_pages.dart';
import 'package:travleapp/utilities/google_sign_in.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirebaseInitialzeApp = false;

  @override
  void initState() {
    initialFirebase();
    super.initState();
  }

  Future<void> initialFirebase() async {
    await Firebase.initializeApp();

    setState(() {
      isFirebaseInitialzeApp = true;
    });
    if (FirebaseAuth.instance.currentUser != null) {
      GoToProfile();
    }
  }

  void GoToProfile() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const Profile();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/gez.jpg"),
              fit: BoxFit.cover,
              opacity: 0.6),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Center(
                    child: Text(
                  "Bize Katıl",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 38,
                  ),
                )),
                const SizedBox(
                  height: 45,
                ),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        child: GestureDetector(
                            onTap: () async {
                              await signInWithGoogle();
                              GoToProfile();
                            },
                            child: LottieBuilder.network(
                                "https://assets6.lottiefiles.com/packages/lf20_cwxda1js.json")),
                      ),
                    ],
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

class Profile extends ConsumerStatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  String image = FirebaseAuth.instance.currentUser!.photoURL!;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.6,
                color: const Color.fromRGBO(240, 240, 240, 0.9),
                // 243 240 240
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(image)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName!,
                      style: const TextStyle(fontSize: 19),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser!.email!,
                      style: const TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: ref.watch(pagesProvider).pages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              if (index == 4) {
                                await SignOuthGoogle();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return const MyProfile();
                                }));
                              }
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                color: const Color.fromRGBO(240, 240, 240, 0.9),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ref.watch(pagesProvider).pages[index],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 45,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
