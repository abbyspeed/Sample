import 'package:architech/components/cards.dart';
import 'package:architech/components/customCalendar.dart';
import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/components/timePicker.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/orderModel.dart';
import 'package:architech/models/parcelModel.dart';
import 'package:architech/pages/order/orderConfirm.dart';
import 'package:flutter/material.dart';

class OrderSchedule extends StatefulWidget{
  OrderSchedule({super.key, required this.order});
  final OrderModelTest order;

  // OrderSchedule({super.key});

  @override
  State<OrderSchedule> createState() => _OrderScheduleState();
}

class _OrderScheduleState extends State<OrderSchedule>{
  int current = 0;

  OrderModelTest order = OrderModelTest();

  PageController pageController = PageController();

  List<String> items = [
    "Date",
    "Time",
  ];

  // List of body icon
  List<IconData> icons = [
    Icons.home,
    Icons.explore,
  ];

  // List of times available
  List<Object> times = [
    // ["10:30:00", 1],
    // ["11:30:00", 0],
    // ["14:30:00", 0],
    // ["15:30:00", 0],
    // ["14:30:00", 1],
    {"time" : "10:30:00", "charge" : 1},
    {"time" : "11:30:00", "charge" : 0},
    {"time" : "14:30:00", "charge" : 0},
    {"time" : "15:30:00", "charge" : 0},
    {"time" : "14:30:00", "charge" : 1}
  ];

  // Testing
  @override
  void initState(){
    super.initState();
    order.name = "Hello";
    order.phoneNumber = "012345";
    order.pickupLocation = "KTC";
    order.deliveryCentre = "OPC";
    order.parcels = [
      ParcelModel("01jaksd")
    ];
  }

  @override
  void dispose(){
    pageController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.9;

    return Scaffold(
      appBar: titleBar(context, "Match your schedule", 50),
      floatingActionButton: InkWell(
        onTap: () => {
          Navigator.pop(context)
        },
        child: SizedBox(
          child: mainBtn(context, "Proceed", false, (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderConfirm(order: order,)));
          })
        ),
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 70),
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                              order.selectedDate!;                        
                            });
                            pageController.animateToPage(
                              current,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease,
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            width: 130,
                            height: 40,
                            decoration: BoxDecoration(
                              color: current == index
                                ? Colors.black
                                : lightGrey,
                              borderRadius: current == index
                                ? BorderRadius.circular(12)
                                : BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    icons[index],
                                    size: current == index ? 23 : 20,
                                    color: current == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    items[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: current == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: height,
                child: PageView.builder(
                  itemCount: icons.length,
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return items[current] == "Date" ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: Text(
                            "Suggested Date",
                            style: TextStyle(
                              fontSize: regular,
                              color: Colors.black
                            ),
                          ),
                        ),
                        suggestedCard(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: CustomCalendar(order: order),
                        )
                      ],
                    ): TimePicker(order: order);
                    // ): SingleChildScrollView(
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    //         child: Text(
                    //           "Suggested time",
                    //           style: TextStyle(
                    //             fontSize: regular,
                    //             color: Colors.black
                    //           ),
                    //         ),
                    //       ),
                    //       suggestedCard(),
                    //       const Padding(
                    //         padding: EdgeInsets.symmetric(horizontal: 20),
                    //         child: Text(
                    //           "Available times"
                    //         ),
                    //       ),
                    //       Container(
                    //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    //         margin: const EdgeInsets.only(bottom: 50),
                    //         child: SizedBox(
                    //           width: MediaQuery.of(context).size.width * 0.9,
                    //           height: 400,
                    //           child: ListView.builder(
                    //             scrollDirection: Axis.vertical,
                    //             physics: const NeverScrollableScrollPhysics(),
                    //             itemCount: order.times.length,
                    //             itemBuilder: (count, index){
                    //               return squareCard(order.times[index].time, order.times[index].extraCharge.toString(), null);
                    //             },
                    //           ),
                    //         ),
                    //       )
                    //     ],
                    //   ),
                    // );
                  },
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}