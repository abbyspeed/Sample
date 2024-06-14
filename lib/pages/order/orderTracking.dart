import 'package:architech/components/logos.dart';
import 'package:architech/config/theme.dart';
import 'package:flutter/material.dart';

class OrderTracking extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
            top: 40,
            left: 30,
            child: appLogo("assets/logo_small.png", 150)
          ),
          Positioned(
            bottom: 10,
            width: width,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: semanticBlue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Parcel 1",
                        style: TextStyle(
                          fontSize: 16
                        )
                      ),
                      Text(
                        "In transit at Lingkaran Ilmu",
                        style: TextStyle(
                          fontSize: 12
                        )
                      )
                    ],
                  ),
                  InkWell(
                    onTap: (){},
                    child: const Icon(
                      Icons.zoom_in_map_rounded
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}