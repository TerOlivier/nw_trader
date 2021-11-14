import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nw_trader/controllers/app_controller.dart';
import 'package:nw_trader/ui/pages/authentication/widgets/redirect_txt_widget.dart';
import 'package:nw_trader/ui/pages/authentication/widgets/login_widget.dart';
import 'package:nw_trader/ui/pages/authentication/widgets/signup_widget.dart';

class AuthenticationPage extends StatelessWidget {
  final AppController _appController = Get.find();

  AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Visibility(
                  visible: _appController.isLoginWidgetDisplayed.value,
                  child: LoginWidget()),
            ),
            Center(
              child: Visibility(
                  visible: !_appController.isLoginWidgetDisplayed.value,
                  child: const RegistrationWidget()),
            ),
            const SizedBox(
              height: 10,
            ),
            Visibility(
              visible: _appController.isLoginWidgetDisplayed.value,
              child: RedirectTextWidget(
                onTap: () {
                  _appController.changeDIsplayedAuthWidget();
                },
                text1: "Don't have an account?",
                text2: "Create account!",
              ),
            ),
            Visibility(
              visible: !_appController.isLoginWidgetDisplayed.value,
              child: RedirectTextWidget(
                onTap: () {
                  _appController.changeDIsplayedAuthWidget();
                },
                text1: "Already have an account?",
                text2: "Sign in!!",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
