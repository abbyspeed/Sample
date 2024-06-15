import 'package:architech/components/cards.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/orderModel.dart';
import 'package:architech/pages/order/shedule_date/provider/shedule_date_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key, required this.order});
  final OrderModelTest order;
  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker>
    with AutomaticKeepAliveClientMixin<TimePicker> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Suggested time",
              style: TextStyle(fontSize: regular, color: Colors.black),
            ),
          ),
          suggestedCard(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Available times"),
          ),
          Consumer<SheduleDateProvider>(
              builder: (context, sheduleDateProvider, _) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: const EdgeInsets.only(bottom: 50),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 400,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.order.times.length,
                    itemBuilder: (count, index) {
                      var data = widget.order.times[index];
                      return GestureDetector(
                        onTap: () {
                          sheduleDateProvider.selectTimes(
                            index,
                            data,
                          );
                        },
                        child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                color: !sheduleDateProvider.initialTimeSelect
                                    ? sheduleDateProvider.selectedTimeIndex ==
                                            index
                                        ? secondaryColour
                                        : Colors.grey[300]
                                    : Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.order.times[index].time,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 24),
                                ),
                                Text(widget.order.times[index].extraCharge
                                    .toString())
                              ],
                            )),
                      );
                    }),
              ),
            );
          })
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
