part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const String HOME = _Paths.HOME;
  static const String LOGIN = _Paths.LOGIN;
  static const String SIGNUP = _Paths.SIGNUP;
  static const String STORE = _Paths.STORE;
  static const String PROFILE = _Paths.PROFILE;
  static const String CART = _Paths.CART;
  static const String CHAT = _Paths.CHAT;
  static const String WISHLIST = _Paths.WISHLIST;
  static const EDIT_PROFILE = _Paths.EDIT_PROFILE;
  static const PRODUCT = _Paths.PRODUCT;
  static const FORGET_PASSWORD = _Paths.FORGET_PASSWORD;
  static const ORDER = _Paths.ORDER;
  static const REVIEW = _Paths.REVIEW;
  static const BUYPAGE = _Paths.BUYPAGE;
}

abstract class _Paths {
  _Paths._();

  static const String HOME = '/home';
  static const String LOGIN = '/login';
  static const String SIGNUP = '/signup';
  static const String STORE = '/store';
  static const String PROFILE = '/profile';
  static const String CART = '/cart';
  static const String CHAT = '/chat';
  static const String WISHLIST = '/wishlist';
  static const EDIT_PROFILE = '/edit-profile';
  static const PRODUCT = '/product';
  static const FORGET_PASSWORD = '/forget-password';
  static const ORDER = '/order';
  static const REVIEW = '/review';
  static const BUYPAGE = '/buypage';
}
