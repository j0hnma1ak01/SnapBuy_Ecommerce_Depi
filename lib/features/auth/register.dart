import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:snap_buy_app/core/helper/extensions/navigation_extension.dart';
import 'package:snap_buy_app/core/routes/routes.dart';
import 'package:snap_buy_app/core/service/local/local_database.dart';
import 'package:snap_buy_app/core/service/remote/stripe/stripe_service.dart';
import 'package:snap_buy_app/features/auth/squared_image.dart';
import 'package:snap_buy_app/features/auth/widgets/custom_text_form_feild.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  static String? email;

  @override
  Widget build(BuildContext context) {
    TextEditingController usernamecon = TextEditingController();
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
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  hintText: "UserName",
                  obscureText: false,
                  controller: usernamecon,
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
                          // Navigator.pushNamed(context, '/Login');
                          context.pushNamed(Routes.loginScreen);
                        },
                        child: Text(
                          "Already have an account ?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),
                      )
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
                                if (formSatate.currentState!.validate()) {
                                  try {
                                    final credential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                      email: emailcon.text,
                                      password: passwordcon.text,
                                    );

                                    addUserDetails(
                                      usernamecon.text.trim(),
                                      Register.email = emailcon.text.trim(),
                                      passwordcon.text
                                          .trim(), // Pass the password as a string
                                    );
                                    FirebaseAuth.instance.currentUser!
                                        .sendEmailVerification();
                                    StripeService().createCustomer(
                                        id: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        name: usernamecon.text);
                                    LocalDatabase.setUserLoggedIn();  
                                    context.pushNamedAndRemoveUntil(
                                        Routes.appLayoutScreen,
                                        predicate: (route) => false);
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.rightSlide,
                                        showCloseIcon: true,
                                        title: 'Error',
                                        desc:
                                            'The password provided is too weak.',
                                      ).show();
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.rightSlide,
                                        title: 'Error',
                                        desc:
                                            'The account already exists for that email.',
                                      ).show();
                                    }
                                  }
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
                                'Sign UP',
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
                        style: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future addUserDetails(String username, String email, String password) async {
  DocumentReference user = FirebaseFirestore.instance.collection('users').doc();

  await user.set({
    'User name': username,
    'Email': email,
    'Password':
        password, // Store the password as a string (or use hash encryption for better security)
    'userid': user.id,
  });
}
