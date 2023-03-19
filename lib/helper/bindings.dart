import 'package:get/get.dart';
import 'package:smsrly/controller/controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller());
  }
}