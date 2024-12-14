import 'app/modules/connection/bindings/network_binding.dart';

class DependencyInjection {
  static void init() {
    NetworkBinding().dependencies();
  }
}