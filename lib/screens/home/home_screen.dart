// ignore_for_file: unnecessary_null_comparison

import 'package:bodytech/screens/photo/photo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../services/auth_service.dart';
import '../list_elements/list_elements.dart';
import '../list_elements/list_elements_controller.dart';
import '../photo/photo_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          elevation: 0,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: const [
                    Text(
                      'Bienvenid@',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(color: Colors.deepPurpleAccent),
              ),
              ListTile(
                trailing: Wrap(
                  spacing: 12,
                  children: const <Widget>[
                    Icon(Icons.logout),
                  ],
                ),
                title: const Text('Cerrar Sesión',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                onTap: () {
                  authService.logout();
                  Navigator.pushReplacementNamed(context, 'login');
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      const Text(
                        'Bienvenid@',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent),
                      ),
                      const Text(
                        '',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurpleAccent),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.put(PhotoController());
                              Get.to(const PhotoPage(),
                                  transition: Transition.zoom);
                            },
                            child: Card(
                              child: Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.yellow,
                                      Colors.deepPurpleAccent,
                                      Colors.yellow.shade300,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: ListTile(
                                  title: Center(
                                      child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "CAPTURAR",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Image(
                                          width: 100,
                                          image: AssetImage('assets/photo.png'),
                                          fit: BoxFit.fill),
                                    ],
                                  )),
                                ),
                              ),
                              elevation: 12,
                              shadowColor: Colors.red,
                              margin: const EdgeInsets.all(20),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.put(ListElementsController());
                              Get.to(ElementsPage(),
                                  transition: Transition.zoom);
                            },
                            child: Card(
                              child: Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.yellow,
                                      Colors.deepPurpleAccent,
                                      Colors.yellow.shade300,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: ListTile(
                                  title: Center(
                                      child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "ELEMENTOS",
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Image(
                                          width: 100,
                                          image:
                                              AssetImage('assets/verified.png'),
                                          fit: BoxFit.fill),
                                    ],
                                  )),
                                ),
                              ),
                              elevation: 12,
                              shadowColor: Colors.red,
                              margin: const EdgeInsets.all(20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
