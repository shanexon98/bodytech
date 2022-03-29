import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/elements_model.dart';
import '../home/home_screen.dart';
import 'list_elements_controller.dart';
import 'list_elements_detail.dart';

class ElementsPage extends StatefulWidget {
  ElementsPage({Key? key}) : super(key: key);

  @override
  _ElementsPageState createState() => _ElementsPageState();
}

class _ElementsPageState extends State<ElementsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lista de elementos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(HomeScreen(), transition: Transition.leftToRight);
          },
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: GetBuilder<ListElementsController>(
          id: 'elements',
          builder: (_) {
            return _.dataList.isNotEmpty
                ? Column(
                    children: [
                      Center(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.82,
                            child: ListView.builder(
                                itemCount: _.dataList.length,
                                itemBuilder: (context, index) {
                                  final item = _.dataList[index];
                                  final userId = item['userId'];
                                  final id = item['id'];
                                  final title = item['title'].toString();
                                  final body = item['body'].toString();
                                  final element = Elements(
                                      title: title,
                                      body: body,
                                      userId: userId,
                                      id: id);
                                  return CardElement(element: element);
                                })),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          }),
    );
  }
}

class CardElement extends StatelessWidget {
  const CardElement({
    Key? key,
    required this.element,
  }) : super(key: key);

  final Elements element;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Get.to(
                    ListDetailPage(
                      elements: element,
                    ),
                    transition: Transition.zoom);
              },
              splashColor: Colors.red,
              child: Card(
                elevation: 5,
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            element.title!.toUpperCase(),
                            maxLines: 6,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
