import 'package:architech/components/cards.dart';
import 'package:architech/components/customCalendar.dart';
import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/components/timePicker.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/orderModel.dart';
import 'package:architech/pages/order/order_confirm/orderConfirm.dart';
import 'package:architech/pages/order/order_confirm/provider/order_confirm_provider.dart';
import 'package:architech/pages/order/shedule_date/provider/shedule_date_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderSchedule extends StatefulWidget {
  const OrderSchedule({super.key, required this.order});
  final OrderModelTest order;
  @override
  State<OrderSchedule> createState() => _OrderScheduleState();
}

class _OrderScheduleState extends State<OrderSchedule> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      SheduleDateProvider controller =
          Provider.of<SheduleDateProvider>(context, listen: false);
      controller.initFunctionShedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.9;

    return Scaffold(
      appBar: titleBar(context, "Match your schedule", 50),
      floatingActionButton: InkWell(
        onTap: () => {Navigator.pop(context)},
        child: Consumer2<SheduleDateProvider, OrderConfirmProvider>(
            builder: (context, sheduleDateProvider, orderConfirmProvider, _) {
          return SizedBox(
              child: mainBtn(context, "Proceed", false, () {
            orderConfirmProvider.changeInitalTime();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderConfirm(
                  order: sheduleDateProvider.order,
                ),
              ),
            );
          }));
        }),
      ),
      body: GestureDetector(child: SingleChildScrollView(
        child: Consumer<SheduleDateProvider>(
            builder: (context, sheduleDateProvider, _) {
          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 70),
                    physics: const BouncingScrollPhysics(),
                    itemCount: sheduleDateProvider.items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              sheduleDateProvider.changeTabShedule(index);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              width: 130,
                              height: 40,
                              decoration: BoxDecoration(
                                color: sheduleDateProvider.current == index
                                    ? Colors.black
                                    : lightGrey,
                                borderRadius:
                                    sheduleDateProvider.current == index
                                        ? BorderRadius.circular(12)
                                        : BorderRadius.circular(7),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      sheduleDateProvider.icons[index],
                                      size: sheduleDateProvider.current == index
                                          ? 23
                                          : 20,
                                      color:
                                          sheduleDateProvider.current == index
                                              ? Colors.white
                                              : Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      sheduleDateProvider.items[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            sheduleDateProvider.current == index
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
                    }),
              ),
              SizedBox(
                width: double.infinity,
                height: height,
                child: PageView.builder(
                  itemCount: sheduleDateProvider.icons.length,
                  controller: sheduleDateProvider.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return sheduleDateProvider
                                .items[sheduleDateProvider.current] ==
                            "Date"
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: Text(
                                  "Suggested Date",
                                  style: TextStyle(
                                      fontSize: regular, color: Colors.black),
                                ),
                              ),
                              suggestedCard(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                child: CustomCalendar(
                                  order: sheduleDateProvider.order,
                                  initialDate:
                                      sheduleDateProvider.order.selectedDate,
                                  onDateSelected: (selectedDate) {
                                    sheduleDateProvider.updateSelectedDate(
                                      selectedDate ?? DateTime.now(),
                                    );
                                    print("Selected Date: $selectedDate");
                                  },
                                ),
                              )
                            ],
                          )
                        : TimePicker(order: sheduleDateProvider.order);
                  },
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}
