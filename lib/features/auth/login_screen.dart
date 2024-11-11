import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:snap_buy_app/core/app_constant.dart';
import 'package:snap_buy_app/core/helper/extensions/navigation_extension.dart';
import 'package:snap_buy_app/core/routes/routes.dart';
import 'package:snap_buy_app/core/service/local/local_database.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';
import 'package:snap_buy_app/core/themes/text_styles.dart';
import 'package:snap_buy_app/core/widgets/custom_app_button.dart';
import 'package:snap_buy_app/features/auth/squared_image.dart';
import 'package:snap_buy_app/features/auth/widgets/custom_text_form_feild.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String? email;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcon = TextEditingController();
    TextEditingController passwordcon = TextEditingController();
    GlobalKey<FormState> formSatate = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            // Add this line
            key: formSatate, // Associate your GlobalKey here
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyles.styleBold(
                          context,
                          fontSize: 50,
                          color: ColorsManager.darkColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextFormField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailcon,
                ),
                CustomTextFormField(
                  hintText: "Password",
                  controller: passwordcon,
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          context.pushNamed(Routes.forgetPassword);
                          //Navigator.pushNamed(context, '/ForgetPassword');
                        },
                        child: Text(
                          "forget password?",
                          style: TextStyles.styleMedium(
                            context,
                            fontSize: 15,
                            color: Colors.red.shade700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomAppButton(
                    width: 350.w,
                    height: 45.h,
                    borderRadius: 15,
                    backgroundColor: ColorsManager.redColor,
                    onPressed: () async {
                      if (formSatate.currentState!.validate()) {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailcon.text,
                                  password: passwordcon.text);
                          LoginScreen.email = emailcon.text;
                          if (credential.user!.emailVerified) {
                            LocalDatabase.setUserLoggedIn();
                            log(LocalDatabase.hasUserLoggedIn().toString());
                            context.pushNamedAndRemoveUntil(
                                Routes.appLayoutScreen,
                                predicate: (route) => false);
                            // Navigator.of(context)
                            //     .pushReplacementNamed("homepage");
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              showCloseIcon: true,
                              title: 'Error',
                              desc: 'Please Verifiy Your Account To Login',
                            ).show();
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == e.code) {
                            // ignore: avoid_print
                            print('Wrong email or Password');
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              showCloseIcon: true,
                              title: 'Error',
                              desc: 'Wrong email or Password',
                            ).show();
                          }
                        }
                      } else {
                        // ignore: avoid_print
                        print("Not valid");
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyles.styleMedium(context,
                          fontSize: 20, color: Colors.white),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 20,
                          color: Colors.grey.shade500,
                          thickness: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "OR Continue with",
                        style: TextStyles.styleBold(
                          context,
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Divider(
                          endIndent: 20,
                          color: Colors.grey.shade500,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SquaredImage(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account ?  ',
                        style: TextStyles.styleSemiBold(
                          context,
                          fontSize: 15,
                          color: Colors.grey,
                        )),
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.registerScreen);
                        //Navigator.pushNamed(context, "/Register");
                      },
                      child: Text(
                        "Register now",
                        style: TextStyles.styleSemiBold(
                          context,
                          fontSize: 15,
                          color: Colors.red.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
