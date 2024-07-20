import 'package:chat_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../constants.dart';
import '../widgets/custom_text_field.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                        "Register",
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
                  text: "Register",
                  onTap: () async {
                    String? errorMessage;
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {

                      });
                      try {
                        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password: password!);
                        Navigator.pushNamed(context, ChatPageId);
                      }
                      on FirebaseAuthException catch(ex) {
                        switch(ex.code) {
                          case "weak-password":
                            errorMessage = "password is weak";
                            break;
                          case 'email-already-in-use':
                            errorMessage = "This email already exists";
                            break;
                        }
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
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        " Log in",
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
