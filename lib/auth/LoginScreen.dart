// ignore_for_file: sort_child_properties_last

import 'dart:developer';
import 'dart:io';
import 'package:assignment/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../api/apis.dart';
import '../helper/dialogs.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //for trigger animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isAnimate = true;
      });
    });
  }

  _googleButtonClick() {
    //two show circular progress indicator
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((User) {
      //to remove circular progress indicator we use navigator.pop
      Navigator.pop(context);
      if (User != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    try {
      await InternetAddress.lookup('google.com');
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      Dialogs.showSnackbar(
          context, 'Something Went Wrong[Double Check your Connection]');
      log('\n _signInWithGoogle: $e.');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            "Welcome To The Quiz",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: Stack(
          children: [
            AnimatedPositioned(
                top: mq.height * .12,
                width: mq.width * .5,
                right: _isAnimate ? mq.width * .25 : -mq.width * .5,
                child: Image.asset("assets/images/loginpage.png"),
                duration: const Duration(seconds: 1)),
            Positioned(
                top: mq.height * .68,
                width: mq.width * .7,
                left: mq.width * .18,
                height: mq.height * .07,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 1,
                        backgroundColor: Colors.deepPurple[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    onPressed: () {
                      _googleButtonClick();
                    },
                    icon: Icon(Icons.login),
                    // Image.asset("assets/images/google.png"),
                    label: RichText(
                        text: const TextSpan(
                            style: TextStyle(color: Colors.white, fontSize: 19),
                            children: [
                          TextSpan(text: "Login With "),
                          TextSpan(
                              text: "Google",
                              style: TextStyle(fontWeight: FontWeight.w400))
                        ]))))
          ],
        ),
      ),
    );
  }
}
