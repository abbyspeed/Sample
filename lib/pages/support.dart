import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/pages/home.dart';
import 'package:flutter/material.dart';

class Support extends StatelessWidget{
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: bottomBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Support Centre",
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 470,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())),
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: width,
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFD6B8),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.warning_amber_rounded,
                              size: 24,
                              color: Colors.black
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Report an issue",
                              style: TextStyle(
                                fontSize: 18
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 60,
                      child: InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())),
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: width,
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFC397),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.favorite_border_outlined,
                                size: 24,
                                color: Colors.black
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Give feedback",
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 120,
                      child: InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())),
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: width,
                          padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF9446),
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
                        ),
                      ),
                    ),
                    Positioned(
                      top: 180,
                      child: InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Home())),
                        child: Container(
                          alignment: Alignment.topCenter,
                          width: width,
                          padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                          height: 260,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF6B00),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  "Visit Our Help Pages",
                                  style: TextStyle(
                                    fontSize: 46,
                                    color: Colors.white
                                  ),
                                ),
                              ),
                              // const Icon(
                              //   Icons.help_outline_rounded,
                              //   size: 130,
                              //   color: Colors.white
                              // ),
                              SizedBox(width: 15),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: -10,
                      right: -40,
                      child: Icon(
                        Icons.help_outline_rounded,
                        size: 200,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Chats",
                style: TextStyle(
                  fontSize: mainTitle
                ),
              ),
              const SizedBox(height: 10),
              Container(
                child: const Text(
                  "You have no chats yet."
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      )
    );
  }
}