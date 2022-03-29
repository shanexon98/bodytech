import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../home/home_screen.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  late Future<File> imageFile;

  File? image;

  Future pickImage() async {
    try {
      final imagePick = ImagePicker();
      final image = await imagePick.pickImage(source: ImageSource.camera);
      if (image == null) {
        const Text('no se pinto nada');
      } else {
        final imageTemporary = File(image.path);

        setState(() {
          this.image = imageTemporary;
        });
      }
    } on PlatformException {
      print('error');
    }
  }

  //Open gallery
  pickImageFromGallery(ImageSource source) {
    setState(() {
      final image = ImagePicker();
      imageFile = image.pickImage(source: source) as Future<File>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Tome una foto'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(HomeScreen(), transition: Transition.leftToRight);
          },
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            const Text(
              'Hola, por favor tome una foto:',
              style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 30,
                  fontFamily: 'Monserrat',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: Stack(
                  children: [
                    image != null
                        ? Container(
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.transparent, width: 10),
                            ),
                            child: Image.file(image!),
                          )
                        : Container(
                            width: 320,
                            height: 380,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.orange, width: 2),
                            ),
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'No se ha tomado ninguna foto',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontFamily: 'Monserrat',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Image(
                                    image: AssetImage('assets/no-image.png'),
                                    fit: BoxFit.cover),
                              ],
                            )),
                    Positioned(
                      bottom: 1,
                      right: 1,
                      child: GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: Container(
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(Icons.add_a_photo, color: Colors.black),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: Colors.white,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  50,
                                ),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 4),
                                  color: Colors.black.withOpacity(
                                    0.3,
                                  ),
                                  blurRadius: 3,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
