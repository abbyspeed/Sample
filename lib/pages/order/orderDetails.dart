import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/orderModel.dart';
import 'package:architech/pages/order/orderEdit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderDetails extends StatefulWidget{
  OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  // Testing
  OrderModelTest order = OrderModelTest();
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: titleBar(context, "Order details", 75),
      bottomNavigationBar: bottomBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width,
              child: Text(
                "Order no: #${order.status}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: subTitle,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            ActionButtons(),
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          order.name,
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Phone number",
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          order.phoneNumber,
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Payment method",
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          order.selectedPayment,
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Number of parcels",
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          order.parcels.length.toString(),
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Delivery time",
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "${order.dateConverter(true)}, ${order.timeConverter(true, null)}",
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "Drop-off location",
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          order.pickupLocation,
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: const EdgeInsets.only(bottom: 50),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (count, index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                              color: semanticBlue,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text(
                              order.parcels[index].parcelStatus,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Parcel ${index + 1 }",
                                  style: TextStyle(
                                    fontSize: subTitle,
                                  ),
                                ),
                                Text(
                                  order.dateConverter(true)
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Tracking no",
                                  style: TextStyle(
                                    color: greyColour
                                  ),
                                ),
                                Text(
                                  order.parcels[index].trackingNo
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                                  margin: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: lightGrey
                                  ),
                                  child: const Row(
                                    children: [
                                      Text(
                                        "Report an issue",
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.report_problem_rounded,
                                        size: 14,
                                      )
                                    ],
                                  )
                                ),
                              ),
                              SizedBox(
                                child: InkWell(
                                  onTap: (){},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                                    margin: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: primaryColour
                                    ),
                                    child: const Row(
                                      children: [
                                        Text(
                                          "Track your parcel here",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.location_pin,
                                          size: 14,
                                          color: Colors.white
                                        )
                                      ],
                                    )
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Divider(),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 5),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Text(
                          //         "Criterias",
                          //         style: TextStyle(
                          //           color: greyColour
                          //         ),
                          //       ),
                          //       Text(
                          //         "criteria"
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      )
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 160,
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 1,
            //     color: greyColour
            //   ),
            //   borderRadius: BorderRadius.circular(8)
            // ),
            child: InkWell(
              onTap: (){},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete_outline_rounded,
                    size: 16
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Request cancel"
                  ),
                ],
              )
            )
          ),
          SizedBox(width: 40),
          Container(
            width: 130,
            padding: const EdgeInsets.symmetric(vertical: 5),
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 1,
            //     color: greyColour
            //   ),
            //   borderRadius: BorderRadius.circular(8)
            // ),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => OrderEdit())
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    size: 16
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Edit order"
                  ),
                ],
              )
            )
          ),
        ],
      ),
    );
  }
}