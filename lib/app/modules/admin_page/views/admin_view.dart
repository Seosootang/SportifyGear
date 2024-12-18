import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/auth_controller.dart';
import 'package:flutter_application_1/app/modules/login_page/views/login_view.dart';
import 'package:get/get.dart';
import '../controllers/admin_controller.dart';

class AdminPage extends StatelessWidget {
  AdminPage({Key? key}) : super(key: key) {
    Get.lazyPut(() => AdminController());
    Get.lazyPut(() => AuthController()); // Pastikan AuthController tersedia
  }

  final AdminController controller = Get.find<AdminController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
        actions: [
          IconButton(
            onPressed: () => controller.fetchAllUsers(),
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh Data',
          ),
          IconButton(
            onPressed: () async {
              await authController.logout(); // Logout logic
              // Navigasi menggunakan Navigator.pushReplacement
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.usersList.isEmpty) {
          return const Center(child: Text('Tidak ada data pengguna'));
        }

        return ListView.builder(
          itemCount: controller.usersList.length,
          itemBuilder: (context, index) {
            final user = controller.usersList[index];
            return ListTile(
              leading: const Icon(Icons.person),
              title: Text(user['name'] ?? 'Tidak ada nama'),
              subtitle: Text(user['email'] ?? 'Tidak ada email'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  controller.deleteUser(user['id']);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
