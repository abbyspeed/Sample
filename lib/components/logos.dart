import 'package:flutter/material.dart';

Image appLogo(String logoName, double width){
  return Image.asset(
    logoName,
    fit: BoxFit.fitWidth,
    width: width,
  );
}