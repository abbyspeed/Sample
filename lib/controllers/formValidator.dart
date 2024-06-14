import 'package:architech/controllers/formItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormValidator extends ChangeNotifier{
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final RegExp textRegex = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']|)) + [A-Za-z]+\.?\s*$");
  // r'^[-+]?\d*\.?\d*(\d+[eE][-+]?)?\d+$'
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final FormItem _text = FormItem(
    message: "Digits are not allowed",
    formatters: [
      FilteringTextInputFormatter.allow(
        RegExp(r"[A-Za-z]+|\s")
      )
    ]
  );

  FormItem get validateText => _text;

  // Universal validator
  validator(String value){
    return value != null && textRegex.hasMatch(value) ? _text.message : null;
  }

  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Please enter your email address.';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Please enter your password.';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    return null;
  }

  String? validateConfirmPassword(String? confirmPassword, String password) {
    if (confirmPassword!.isEmpty) {
      return 'Please enter your password confirmation.';
    } else if (confirmPassword != password) {
      return 'Password must match';
    }
    return null;
  }

}
