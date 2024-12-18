import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AdminController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Loading State
  RxBool isLoading = false.obs;

  // List untuk menyimpan data pengguna
  RxList<Map<String, dynamic>> usersList = <Map<String, dynamic>>[].obs;

  // Ambil semua data pengguna
  Future<void> fetchAllUsers() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await _firestore.collection('users').get();
      usersList.value = snapshot.docs
          .map((doc) => {
                'id': doc.id,
                ...doc.data() as Map<String, dynamic>,
              })
          .toList();
    } catch (e) {
      Get.snackbar('Error', 'Gagal memuat data pengguna: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Hapus pengguna berdasarkan ID
  Future<void> deleteUser(String userId) async {
    try {
      isLoading.value = true;
      await _firestore.collection('users').doc(userId).delete();
      usersList.removeWhere((user) => user['id'] == userId);
      Get.snackbar('Berhasil', 'Pengguna berhasil dihapus');
    } catch (e) {
      Get.snackbar('Error', 'Gagal menghapus pengguna: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
