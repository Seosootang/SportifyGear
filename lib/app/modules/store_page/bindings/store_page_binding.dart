import 'package:flutter_application_1/app/modules/store_page/controllers/store_controller.dart';
import 'package:get/get.dart';



class StorePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(),
    );
  }
}
