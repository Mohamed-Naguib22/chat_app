import 'package:chat_app/constants.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/pages/sign_in_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPageId : (context) => SignInPage(),
        RegisterPageId : (context) => RegisterPage(),
        ChatPageId : (context) => ChatPage(),
      },
      title: 'Scholar Chat',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
        ),
        appBarTheme:const  AppBarTheme(
          color: kPrimaryColor,
          centerTitle: true,
        ),
      ),
      home: SignInPage(),
    );
  }
}
