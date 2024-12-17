import 'package:get/get.dart';

import '../controllers/buypage_controller.dart';

class BuypageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyPageController>(
      () => BuyPageController(),
    );
  }
}
