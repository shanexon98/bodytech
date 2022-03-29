import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ListElementsController extends GetxController {
  @override
  void onReady() {
    getElements();
    super.onReady();
  }

  @override
  void onInit() {
    getElements();
    super.onInit();
  }

  List dataList = [];

  void getElements() async {
    final data = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));

    dataList = jsonDecode(data.body);

    update(['elements']);
  }
}
