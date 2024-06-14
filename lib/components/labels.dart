import 'package:architech/models/lists.dart';
import 'package:flutter/material.dart';

Container status(String text, int index){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: label[index],
      borderRadius: BorderRadius.circular(50),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold
      ),
    ),
  );
}