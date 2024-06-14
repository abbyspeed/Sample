import 'package:architech/config/theme.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/profile.dart';
import 'package:flutter/material.dart';

class BottomAppBarModel{
  final Icon icon;
  final bool isActive;
  // final Route route;
  
  // BottomAppBarModel({required this.icon, required this.route});
  BottomAppBarModel({required this.icon, this.isActive = false});
}

List<BottomAppBarModel> barItems = [
  BottomAppBarModel(
    icon: Icon(
      Icons.home_outlined,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Home()) 
  ),

  BottomAppBarModel(
    icon: Icon(
      Icons.my_location_outlined,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Home()) 
  ),

  BottomAppBarModel(
    icon: Icon(
      Icons.chat_bubble_outline,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Home()) 
  ),

  BottomAppBarModel(
    icon: Icon(
      Icons.person_outline,
      color: greyColour,
      size: iconSize
    ),
    // route: MaterialPageRoute(builder: (_) => const Profile()) 
  ),
];