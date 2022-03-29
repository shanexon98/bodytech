import 'package:bodytech/screens/photo/photo_controller.dart';
import 'package:get/get.dart';

import 'screens/home/home_controller.dart';
import 'screens/list_elements/list_elements_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ListElementsController>(() => ListElementsController());
    Get.lazyPut<PhotoController>(() => PhotoController());
  }
}
