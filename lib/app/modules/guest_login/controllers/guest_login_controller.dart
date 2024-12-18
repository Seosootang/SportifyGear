import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/login_page/views/login_view.dart';

class GuestLoginController extends GetxController {
  void navigateToLogin() {
    Get.offAll(LoginPage());
  }
}