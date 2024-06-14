import 'package:architech/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:architech/controllers/formValidator.dart';
import 'package:architech/components/form.dart';
import 'package:architech/services/auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final FormValidator _formValidator = FormValidator();
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Enter your email address to reset your password',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              // TextFormField(
              //   controller: emailController,
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     labelText: 'Email',
              //   ),
              //   validator: _formValidator.validateEmail,
              // ),
              // SizedBox(height: 20.0),

              authTextFormField("UTM Email", "Enter your registered email", false,
                  emailController, _emailValidator),
              ElevatedButton(
                onPressed: resetPassword,
                child: const Text('Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _emailValidator() async {
    String email = emailController.text;

    _formValidator.validateEmail(email);
  }

  void resetPassword() async {
    String email = emailController.text;
    User? user = await _auth.resetPasswordWithEmail(email);

    if (user == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    } else {
      print("some error");
    }
  }
}
