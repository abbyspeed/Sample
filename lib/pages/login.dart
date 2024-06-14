import 'package:architech/components/form.dart';
import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/controllers/formValidator.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:architech/services/auth.dart';
import 'package:architech/controllers/formValidator.dart';
import 'package:architech/pages/forgot_password.dart';
import 'package:architech/pages/orders.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();

  final FormValidator _formValidator = FormValidator();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isInputFilled = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, height * 0.1, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                appLogo("assets/logo_full.png", 300),
                const SizedBox(height: 30),
                Text(
                  "Log into your account",
                  style: TextStyle(
                    fontSize: mainTitle,
                  ),
                ),
                const SizedBox(height: 30),
                authTextFormField("UTM Email", "Enter your registered email", false,
                    emailController, _emailValidator),
                authTextFormField("Password", "Enter your password", true,
                    passwordController, _passwordValidator),
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: textLink(
                          context, "Forgot password?", "", Colors.black),
                      onTap: () => {
                        // Navigate to Forgot Password

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()))
                      },
                    )),
                const SizedBox(height: 80),
                // mainBtn(context, "Login", true, () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const Home()));
                // }),
                // mainBtn(context, "Login", true, _signIn),
                mainBtn(context, "Login", true, _signIn),

                InkWell(
                  child: textLink(
                      context, "No account? ", "Sign up here", Colors.black),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Signup())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _emailValidator() async {
    String email = emailController.text;

    _formValidator.validateEmail(email);
  }

  void _passwordValidator() async {
    String password = passwordController.text;

    _formValidator.validateEmail(password);
  }

  void _signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully created");

      // Change to the MyOrderScreen();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Orders()));
    } else {
      print("some error");
    }
  }

  // String? validateEmail(String? email) {
  //   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  //   if (email!.isEmpty) {
  //     return 'Please enter your email address.';
  //   } else if (!emailRegex.hasMatch(email)) {
  //     return 'Please enter a valid email address.';
  //   }
  //   return null;
  // }

  // String? validatePassword(String? password) {
  //   if (password!.isEmpty) {
  //     return 'Please enter your password.';
  //   } else if (password.length < 6) {
  //     return 'Password must be at least 6 characters long.';
  //   }

  //   return null;
  // }
}
