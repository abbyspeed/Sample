import 'package:flutter/services.dart';

class FormItem{
  FormItem({
    this.message,
    this.formatters = const []
  });
  late final String? message;
  late final List<TextInputFormatter> formatters;
}