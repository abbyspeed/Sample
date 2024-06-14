import 'package:architech/components/form.dart';
import 'package:architech/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingPage extends StatelessWidget{
  const LoadingPage({super.key, required this.title, required this.note});

  final String title, note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Container(
                      width: 15,
                      height: 15,
                      color: lightGrey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Container(
                      width: 15,
                      height: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipOval(
                    child: Container(
                      width: 15,
                      height: 15,
                      color: primaryColour,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: mainTitle
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 200,
              child: Text(
                note,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: greyColour
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

class OrderStatusPage extends StatelessWidget{
  const OrderStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  right: 35,
                  child: Icon(
                    Icons.check_rounded,
                    color: lightGrey,
                    size: 60,
                  ),
                ),
                const Positioned(
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.black,
                    size: 60,
                  ),
                ),
                Positioned(
                  left: 35,
                  child: Icon(
                    Icons.check_rounded,
                    color: primaryColour,
                    size: 60,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Order Successful",
            style: TextStyle(
              fontSize: mainTitle
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: outlinedBtn(context, "See your order", null, (){}),
          )
        ],
      ),
    );
  }
}