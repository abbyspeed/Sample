import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/pages/order/fill_your_details/provider/fill_your_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenPickYourParcelCriteria extends StatefulWidget {
  const ScreenPickYourParcelCriteria(
      {super.key,
      required this.parcelName,
      required this.index,
      required this.criteria});
  final String parcelName;
  final int index;
  final List<String> criteria;
  @override
  State<ScreenPickYourParcelCriteria> createState() =>
      _ScreenPickYourParcelCriteria();
}

class _ScreenPickYourParcelCriteria
    extends State<ScreenPickYourParcelCriteria> {
  List<String> selectedCriteria = [];
  List colorList = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  List borderList = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
  ];

  List<String> selectedList = [
    "false",
    "false",
    "false",
    "false",
    "false",
    "false"
  ];

  @override
  void initState() {
    initFunction();
  }

  void initFunction() {
    setState(() {
      selectedCriteria = widget.criteria;
      for (int i = 0; i < widget.criteria.length; i++) {
        if (selectedCriteria.contains("Medium")) {
          colorList[0] = secondaryColour;
          colorList[1] = lightGrey;
          colorList[2] = lightGrey;
          borderList[1] = lightGrey;
          borderList[2] = lightGrey;
          selectedList[0] = "true";
          selectedList[1] = "disabled";
          selectedList[2] = "disabled";
        }
        if (selectedCriteria.contains("Small")) {
          colorList[1] = secondaryColour;
          colorList[0] = lightGrey;
          colorList[2] = lightGrey;
          borderList[0] = lightGrey;
          borderList[2] = lightGrey;
          selectedList[1] = "true";
          selectedList[0] = "disabled";
          selectedList[2] = "disabled";
        }
        if (selectedCriteria.contains("Heavy")) {
          colorList[2] = secondaryColour;
          colorList[0] = lightGrey;
          colorList[1] = lightGrey;

          borderList[0] = lightGrey;
          borderList[1] = lightGrey;

          selectedList[2] = "true";
          selectedList[0] = "disabled";
          selectedList[1] = "disabled";
        }
        if (selectedCriteria.contains("No receipt")) {
          colorList[3] = secondaryColour;
          colorList[5] = lightGrey;

          borderList[5] = lightGrey;

          selectedList[3] = "true";
          selectedList[5] = "disabled";
        }
        if (selectedCriteria.contains("Fragile")) {
          colorList[4] = secondaryColour;
          selectedList[4] = "true";
        }
        if (selectedCriteria.contains("Has receipt")) {
          colorList[5] = secondaryColour;
          colorList[3] = lightGrey;
          borderList[3] = lightGrey;
          selectedList[5] = "true";
          selectedList[3] = "disabled";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(context, "Pick your parcel criteria", 35),
      floatingActionButton: InkWell(
        onTap: () => {Navigator.pop(context)},
        child: Consumer<FillYourDetailsProvider>(
            builder: (context, fillYourDetailsProvider, _) {
          return SizedBox(
              child: mainBtn(context, "Proceed", false, () {
            fillYourDetailsProvider.addCriteriaList(
              "Medium",
              widget.index,
              parcelName: widget.parcelName,
              criteria: selectedCriteria,
            );
            Navigator.pop(context, selectedCriteria);
          }));
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Parcel ${widget.parcelName}",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 250,
              height: 500,
              child: Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: 50,
                    left: -20,
                    child: InkWell(
                      onTap: () {
                        if (selectedCriteria.contains("Medium")) {
                          setState(() {
                            selectedList[0] = "false";
                            selectedList[1] = "false";
                            selectedList[2] = "false";
                            colorList[0] = whiteColor;
                            colorList[1] = whiteColor;
                            colorList[2] = whiteColor;
                            borderList[0] = Colors.black;
                            borderList[1] = Colors.black;
                            borderList[2] = Colors.black;
                            selectedCriteria.remove("Medium");
                          });
                          // colorList[0] = Colors.white;
                        } else {
                          if (selectedList[0] == "false" &&
                              (selectedList[1] == "false" ||
                                  selectedList[2] == "false")) {
                            setState(() {
                              colorList[0] = secondaryColour;
                              colorList[1] = lightGrey;
                              colorList[2] = lightGrey;
                              borderList[1] = lightGrey;
                              borderList[2] = lightGrey;
                              selectedList[0] = "true";
                              selectedList[1] = "disabled";
                              selectedList[2] = "disabled";
                              selectedCriteria.add("Medium");
                            });
                          } else if (selectedList[0] == "false" &&
                              (selectedList[1] == "true" ||
                                  selectedList[2] == "true")) {
                            setState(() {
                              colorList[0] = lightGrey;
                              selectedList[0] = "disabled";
                            });
                            null;
                          }
                        }
                      },
                      radius: 20,
                      child: Container(
                          width: 120,
                          height: 125,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: selectedList[0] == "true"
                                      ? borderList[0] = secondaryColour
                                      : borderList[0]),
                              borderRadius: BorderRadius.circular(20),
                              color: colorList[0]),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "4-7kg",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text("Medium"),
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: -10,
                    child: InkWell(
                      onTap: () {
                        if (selectedCriteria.contains("Small")) {
                          setState(() {
                            selectedList[0] = "false";
                            selectedList[1] = "false";
                            selectedList[2] = "false";
                            colorList[0] = whiteColor;
                            colorList[1] = whiteColor;
                            colorList[2] = whiteColor;
                            borderList[0] = Colors.black;
                            borderList[1] = Colors.black;
                            borderList[2] = Colors.black;
                            selectedCriteria.remove("Small");
                          });
                        } else {
                          if (selectedList[1] == "false" &&
                              (selectedList[0] == "false" ||
                                  selectedList[2] == "false")) {
                            setState(() {
                              colorList[1] = secondaryColour;
                              colorList[0] = lightGrey;
                              colorList[2] = lightGrey;
                              borderList[0] = lightGrey;
                              borderList[2] = lightGrey;
                              selectedList[1] = "true";
                              selectedList[0] = "disabled";
                              selectedList[2] = "disabled";
                              selectedCriteria.add("Small");
                            });
                          } else if (selectedList[1] == "false" &&
                              (selectedList[0] == "true" ||
                                  selectedList[2] == "true")) {
                            setState(() {
                              colorList[1] = lightGrey;
                              selectedList[1] = "disabled";
                            });
                            null;
                          }
                        }
                      },
                      radius: 20,
                      child: Container(
                          width: 110,
                          height: 120,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: selectedList[1] == "true"
                                      ? borderList[1] = secondaryColour
                                      : borderList[1]),
                              borderRadius: BorderRadius.circular(20),
                              color: colorList[1]),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "0.1-3kg",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text("Small"),
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 150,
                    left: -50,
                    child: InkWell(
                      onTap: () {
                        if (selectedCriteria.contains("Heavy")) {
                          setState(() {
                            selectedList[0] = "false";
                            selectedList[1] = "false";
                            selectedList[2] = "false";
                            colorList[0] = whiteColor;
                            colorList[1] = whiteColor;
                            colorList[2] = whiteColor;
                            borderList[0] = Colors.black;
                            borderList[1] = Colors.black;
                            borderList[2] = Colors.black;
                            selectedCriteria.remove("Heavy");
                          });
                        } else {
                          if (selectedList[2] == "false" &&
                              (selectedList[0] == "false" ||
                                  selectedList[1] == "false")) {
                            setState(() {
                              colorList[2] = secondaryColour;
                              colorList[0] = lightGrey;
                              colorList[1] = lightGrey;

                              borderList[0] = lightGrey;
                              borderList[1] = lightGrey;

                              selectedList[2] = "true";
                              selectedList[0] = "disabled";
                              selectedList[1] = "disabled";

                              selectedCriteria.add("Heavy");
                            });
                          } else if (selectedList[2] == "false" &&
                              (selectedList[0] == "true" ||
                                  selectedList[1] == "true")) {
                            setState(() {
                              colorList[2] = lightGrey;
                              selectedList[2] = "disabled";
                            });
                            null;
                          }
                        }
                      },
                      radius: 20,
                      child: Container(
                          width: 140,
                          height: 155,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: selectedList[2] == "true"
                                      ? borderList[2] = secondaryColour
                                      : borderList[2]),
                              borderRadius: BorderRadius.circular(20),
                              color: colorList[2]),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "8kg+",
                                style: TextStyle(fontSize: 24),
                              ),
                              Text("Heavy"),
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    right: -50,
                    child: InkWell(
                      onTap: () {
                        if (selectedCriteria.contains("No receipt")) {
                          setState(() {
                            selectedList[3] = "false";
                            selectedList[5] = "false";
                            colorList[5] = Colors.black;
                            borderList[5] = Colors.black;
                            borderList[3] = Colors.black;
                            colorList[3] = whiteColor;
                            colorList[5] = whiteColor;
                            selectedCriteria.remove("No receipt");
                          });
                        } else {
                          if (selectedList[3] == "false" &&
                              selectedList[5] == "false") {
                            setState(() {
                              colorList[3] = secondaryColour;
                              colorList[5] = lightGrey;
                              borderList[5] = lightGrey;
                              selectedList[3] = "true";
                              selectedList[5] = "disabled";
                              selectedCriteria.add("No receipt");
                            });
                          } else if (selectedList[3] == "false" &&
                              selectedList[5] == "true") {
                            setState(() {
                              colorList[3] = lightGrey;
                              selectedList[3] = "disabled";
                            });
                            null;
                          }
                        }
                      },
                      radius: 20,
                      child: Container(
                          width: 180,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: selectedList[3] == "true"
                                      ? borderList[3] = secondaryColour
                                      : borderList[3]),
                              borderRadius: BorderRadius.circular(20),
                              color: colorList[3]),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "No Centre Receipt",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 120,
                    right: -45,
                    child: InkWell(
                      onTap: () {
                        if (selectedCriteria.contains("Fragile")) {
                          setState(() {
                            colorList[4] = whiteColor;
                            borderList[4] = Colors.black;
                            selectedList[4] = "false";
                            selectedCriteria.remove("Fragile");
                          });
                        } else {
                          setState(() {
                            colorList[4] = secondaryColour;
                            selectedList[4] = "true";
                            selectedCriteria.add("Fragile");
                          });
                        }
                      },
                      radius: 20,
                      child: Container(
                          width: 130,
                          height: 80,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: selectedList[4] == "true"
                                      ? borderList[4] = secondaryColour
                                      : borderList[4]),
                              borderRadius: BorderRadius.circular(20),
                              color: colorList[4]),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Fragile",
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: -30,
                    child: InkWell(
                      onTap: () {
                        if (selectedCriteria.contains("Has receipt")) {
                          setState(() {
                            selectedList[3] = "false";
                            selectedList[5] = "false";
                            borderList[5] = Colors.black;
                            borderList[3] = Colors.black;
                            colorList[3] = whiteColor;
                            colorList[5] = whiteColor;
                            selectedCriteria.remove("Has receipt");
                          });
                        } else {
                          if (selectedList[5] == "false" &&
                              selectedList[3] == "false") {
                            setState(() {
                              colorList[5] = secondaryColour;
                              colorList[3] = lightGrey;
                              borderList[3] = lightGrey;
                              selectedList[5] = "true";
                              selectedList[3] = "disabled";
                              selectedCriteria.add("Has receipt");
                            });
                          } else if (selectedList[5] == "false" &&
                              selectedList[3] == "true") {
                            setState(() {
                              colorList[5] = lightGrey;
                              selectedList[5] = "disabled";
                            });
                            null;
                          }
                        }
                      },
                      radius: 20,
                      child: Container(
                          width: 180,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  color: selectedList[5] == "true"
                                      ? borderList[5] = secondaryColour
                                      : borderList[5]),
                              borderRadius: BorderRadius.circular(20),
                              color: colorList[5]),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Has Centre Receipt",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
