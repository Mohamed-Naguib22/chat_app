import 'package:chat_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? email;
  String? password;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Image.asset("assets/scholar.png"),
                const Text(
                    "Scholar Chat",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32
                    )
                ),
                const Spacer(
                  flex: 1,
                ),
                const Row(
                  children: [
                    Text(
                        "LOG IN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24
                        )
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CustomTextField(text: "Email",
                    onChanged: (data) {
                      email = data;
                    }
                ),
                const SizedBox(height: 15),
                CustomTextField(
                    text: "Password",
                    onChanged: (data) {
                      password = data;
                    }
                ),
                const SizedBox(height: 15),
                CustomButton(
                  text: "LOG IN",
                  onTap: () async {
                    String? errorMessage = "Something Went wrong";
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {

                      });
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: password!);
                        Navigator.pushNamed(context, ChatPageId);
                      }
                      on FirebaseAuthException catch(ex) {
                      errorMessage = "Email or Password are wrong";
                      //   switch(ex.code) {
                      //     case 'user-not-found':
                      //       errorMessage = "Wrong Email";
                      //       break;
                      //     case 'wrong-password':
                      //       errorMessage = "Wrong Password";
                      //       break;
                      //   }
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:  Text(errorMessage!), backgroundColor: Colors.red));
                      }
                      isLoading = false;
                      setState(() {

                      });
                    }
                    else {
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don\'t have an account?",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPageId);
                      },
                      child: const Text(
                        " Register",
                        style: TextStyle(
                          color: Color(0xffc7ede6),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
