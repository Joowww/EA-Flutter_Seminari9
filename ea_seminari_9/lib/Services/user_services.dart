import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Models/user.dart';
import '../Controllers/user_controller.dart';

class UserServices extends GetxController {
  final UserController _userController = UserController();
  var users = <User>[].obs;
  var isLoading = true.obs;

  Future<void> loadUsers() async {
    try {
      isLoading(true);
      final usersList = await _userController.fetchUsers();
      users.assignAll(usersList);
    } catch (e) {
      print('Error loading users: $e');
      Get.snackbar(
        'Error',
        'No se pudieron cargar los usuarios: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }
}