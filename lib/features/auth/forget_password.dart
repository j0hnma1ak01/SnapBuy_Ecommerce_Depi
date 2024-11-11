import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snap_buy_app/core/helper/extensions/navigation_extension.dart';
import 'package:snap_buy_app/core/routes/routes.dart';
import 'package:snap_buy_app/features/auth/widgets/custom_text_form_feild.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcon = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Forget Password",
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                "Please  enter your email address. you will receive a link to create a new password via email",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomTextFormField(
              hintText: "Email",
              obscureText: false,
              controller: emailcon,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      context.pushNamed(Routes.loginScreen);
                      //Navigator.restorablePopAndPushNamed(context, '/Login');
                    },
                    child: Center(
                      child: Text.rich(TextSpan(children: [
                        const TextSpan(
                          text: "Try to?",
                        ),
                        TextSpan(
                          text: " Login",
                          style: TextStyle(
                              color: Colors.red.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                      ])),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () async {
                            // ignore: unnecessary_null_comparison
                            if (emailcon.text == null ||
                                emailcon.text.isEmpty) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                title: 'Warning',
                                desc: 'Enter An Email First!',
                              ).show();
                              return;
                            }
                            try {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                      email: emailcon.text.trim());
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.rightSlide,
                                showCloseIcon: true,
                                title: 'Success',
                                desc:
                                    'Check Your Account We Sent Link To Reset Password',
                              ).show();
                              // ignore: unused_catch_clause
                            } on FirebaseAuthException catch (e) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                showCloseIcon: true,
                                title: 'Error',
                                desc: 'Email not found',
                              ).show();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'SEND',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
