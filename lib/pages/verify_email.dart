import 'dart:async';

import 'package:architech/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:architech/config/theme.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
// User need to be created first
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendEmail = true);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      // if email verified go to Login()
      ? Login()

      // else go to the email verification page
      : Scaffold(
          appBar: AppBar(
            title: Text('Verify Email'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email,
                  size: 100.0,
                  color: primaryColour,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Please verify your email address',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  'A verification link has been sent to your email. Please check your inbox and click on the link to verify your email address.',
                  style: TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: canResendEmail ? sendVerificationEmail : () => {},
                  child: Text('Resend Verification Email'),
                ),
              ],
            ),
          ),
        );
}
