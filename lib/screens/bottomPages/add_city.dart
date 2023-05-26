import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addCity extends StatefulWidget {
  const addCity({Key? key}) : super(key: key);

  @override
  State<addCity> createState() => _addCityState();
}

class _addCityState extends State<addCity> {
  var streamyonet = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                camera();
              },
              child: Icon(
                Icons.camera_alt_outlined,
                size: 35,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                galery();
              },
              child: Icon(
                Icons.photo,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }

  camera() async {
    final ImagePicker _picker = ImagePicker();
    int deg = Random().nextInt(10000);

    var _file = await _picker.pickImage(source: ImageSource.camera);
    var _profilref =
        await FirebaseStorage.instance.ref('Gezdim/fotograflar/${deg}');

    var _task = _profilref.putFile(File(_file!.path));

    _task.whenComplete(() async {
    // gönderilen dosya URL  var _url = await _profilref.getDownloadURL();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Yükleme İşlemi Tamamlandı'),
      ));
    });
  }

  galery() async {
    final ImagePicker _picker = ImagePicker();

    int deg = Random().nextInt(1000000000);
    int deg2 = Random().nextInt(1000000000);
    int deg3 = Random().nextInt(1000000000);
    int deg4 = Random().nextInt(1000000000);

    var image = deg * deg2 * deg3 * deg4;
    XFile? _file = await _picker.pickImage(source: ImageSource.gallery);

    var _profileref =
        FirebaseStorage.instance.ref('Gezdim/fotograflar/${image}');

    var _task = _profileref.putFile(File(_file!.path));

    _task.whenComplete(() async {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Yükleme İşlemi Tamamlandı'),
      ));
    });
  }
}
