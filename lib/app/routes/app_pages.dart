import 'package:get/get.dart';
import '../modules/cart_page/views/cart_view.dart';
import '../modules/chat_page/views/chat_view.dart';
import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login_page/views/login_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/profile_page/views/profile_view.dart';
import '../modules/signup_page/views/signup_view.dart';
import '../modules/store_page/views/store_view.dart';
import '../modules/wishlist_page/views/wishlist_view.dart';

import '../modules/cart_page/bindings/cart_binding.dart';
import '../modules/admin_page/bindings/admin_binding.dart'; // Tambahkan import AdminBinding
import '../modules/admin_page/views/admin_view.dart'; // Tambahkan import AdminPage

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: _Paths.STORE,
      page: () => StorePage(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => CartPage(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatPage(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => WishlistPage(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordPage(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderPage(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN, // Tambahkan halaman admin di sini
      page: () => AdminPage(),
      binding: AdminBinding(),
    ),
  ];
}