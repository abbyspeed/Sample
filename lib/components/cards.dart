import 'package:architech/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// TODO: Complete this widget
Container supportCard(
  double width, 
  Color colour,
  Icons icon, 
  double height, 
  String text){
  return Container(
    alignment: Alignment.topCenter,
      width: width,
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFFF9446),
        borderRadius: BorderRadius.circular(20)
      ),
      child: const Row(
        children: [
          Icon(
            Icons.arrow_outward_rounded,
            size: 24,
            color: Colors.black
          ),
          SizedBox(width: 15),
          Text(
            "Read about us",
            style: TextStyle(
              fontSize: 18
            ),
          ),
        ],
      ),
  );
}

// TODO: Add parameters
Container suggestedCard(){
  return Container(
    padding: const EdgeInsets.fromLTRB(40, 20, 0, 20),
    margin: const EdgeInsets.only(bottom: 20),
    width: 500,
    decoration: BoxDecoration(
      color: primaryColour
    ),
    child: Stack(
      children: [
        const SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Less busy"
              ),
              Text(
                "18 April",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                "3 days from now"
              ),
            ]
          ),
        ),
        Positioned(
          top: 15,
          right: 10,
          child: Container(
            width: 70,
            height: 80,
            child: const Text(
              "Reserve this slot",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            ),
          )
        ),
      ],
    )
  );
}

// 
Container squareCard(String text1, String? text2, IconData? icon){
  return Container(
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black
      ),
      borderRadius: BorderRadius.circular(10)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1
        ),
        text2 != null ?
        Text(
          text2
        )
        : Icon(
          icon,
          color: Colors.black,
        )
      ],
    )
  );
}