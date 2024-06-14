import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:flutter/material.dart';

class HelpCentre extends StatefulWidget{
  @override
  State<HelpCentre> createState() => _HelpCentreState();
}

class _HelpCentreState extends State<HelpCentre> {
  late final int index;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(context, "Help Centre", 90),
      bottomNavigationBar: bottomBar(context),
      body: SingleChildScrollView(
        child: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => QuestionItem(index: index)),
          ),
      )
    );
  }

  
}

class QuestionItem extends StatefulWidget{
  QuestionItem({super.key, required this.index});

  int index;

  @override
  State<QuestionItem> createState() => _QuestionItemState();
}

class _QuestionItemState extends State<QuestionItem> {
  bool isShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(context, "Help Centre", 90),
      bottomNavigationBar: bottomBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text(
                      "User Account",
                      style: TextStyle(
                        fontSize: mainTitle
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isShown == false ? isShown = true : isShown = false;
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "How to deactivate my account?",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: greyColour 
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 30,
                                color: greyColour,
                              )
                            ],
                          ),
                        ),
                        Visibility(
                          visible: isShown,
                          child: const Divider()
                        ),
                        Visibility(
                          visible: isShown,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                            child: Text(
                              "To delete your account, please follow these steps:\n\n" + 
                              "1. Go to your profile by clicking on the left-most icon on your navigation bar.\n" +
                              "2. Scroll down to the bottom to find ‘Delete my account’.\n" +
                              "3. Complete verification to proceed with the account deletion.\n" +
                              "4. All done! Though, we are really sad to see you go :’)",
                              style: TextStyle(
                                fontSize: 16,
                                height: 1.5,
                                fontWeight: FontWeight.normal
                              ),
                            )
                          ),
                        ),
                        const Divider(),
                      ]
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Can I be a delivery person?",
                          style: TextStyle(
                            fontSize: 16,
                            color: greyColour 
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                          color: greyColour,
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Text(
                      "Orders",
                      style: TextStyle(
                        fontSize: mainTitle
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Can I cancel my order?",
                          style: TextStyle(
                            fontSize: 16,
                            color: greyColour 
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                          color: greyColour,
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My order arrived late",
                          style: TextStyle(
                            fontSize: 16,
                            color: greyColour 
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                          color: greyColour,
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "When will QR payment be available?",
                          style: TextStyle(
                            fontSize: 16,
                            color: greyColour 
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                          color: greyColour,
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}