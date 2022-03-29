import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/elements_model.dart';

// ignore: must_be_immutable
class ListDetailPage extends StatelessWidget {
  ListDetailPage({Key? key, required this.elements}) : super(key: key);
  late Elements elements;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shadowColor: Colors.white,
                borderOnForeground: false,
                elevation: 20,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        elements.title.toString().toUpperCase(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'ID',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              Text(
                                elements.id.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'User ID',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              Text(
                                elements.userId.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Text(
                        elements.body.toString(),
                        maxLines: 10,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
