import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nw_trader/constants/controllers.dart';
import 'package:nw_trader/ui/widgets/custom_btn_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: authController.emailController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: "Email"),
            ),
            TextField(
              controller: authController.passwordController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: "Password"),
            ),
            CustomButtonWidget(
              bgColor: Colors.blue.shade700,
              text: "Login",
              onTap: () {
                authController.signIn();
              },
            ),
          ],
        ),
      ),
    );
  }
}


/*
_initialUI(){
  return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(20)),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: authController.emailController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Email"),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: authController.passwordController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Password"),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: CustomButtonWidget(
              bgColor: Colors.blue.shade700,
              text: "Login",
              onTap: () {
                authController.signIn();
              },
            ),
          )
        ],
      ),
    );
}
*/