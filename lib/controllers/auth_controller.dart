import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nw_trader/constants/firebase.dart';
import 'package:nw_trader/models/user_model.dart';
import 'package:nw_trader/ui/pages/authentication/authentication_page.dart';
import 'package:nw_trader/ui/pages/home/home_page.dart';
import 'package:nw_trader/utils/loading_util.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  Rx<UserModel> userModel = UserModel().obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usersCollection = "users";

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => AuthenticationPage());
    } else {
      Get.offAll(() => const HomePage());
    }
  }

  void signIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((result) {
        String _userId = result.user!.uid;
        _initializeUserModel(_userId);
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signUp() async {
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((result) {
        if (result.user != null && result.user?.uid != null) {
          String _userId = result.user!.uid;
          _addUserToFirestore(_userId);
          _initializeUserModel(_userId);
          _clearControllers();
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Sign In Failed", "Try again");
    }
  }

  void signOut() async {
    auth.signOut();
  }

  Future<void> _addUserToFirestore(String userId) async {
    await firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": nameController.text.trim(),
      "id": userId,
      "email": emailController.text.trim()
    });
  }

  Future<void> _initializeUserModel(String userId) async {
    userModel.value = await firebaseFirestore
        .collection(usersCollection)
        .doc(userId != "" ? userId : null)
        .get()
        .then((doc) => UserModel.fromSnapshot(doc));
  }

  _clearControllers() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
