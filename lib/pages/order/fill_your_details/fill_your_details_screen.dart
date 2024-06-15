import 'package:architech/components/customDropdown.dart';
import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/pages/order/fill_your_details/widget/fill_widget.dart';
import 'package:architech/pages/order/shedule_date/provider/shedule_date_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/fill_your_details_provider.dart';

class ScreenFillYourDetails extends StatefulWidget {
  const ScreenFillYourDetails({super.key});

  @override
  State<ScreenFillYourDetails> createState() => _ScreenFillYourDetails();
}

class _ScreenFillYourDetails extends State<ScreenFillYourDetails> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      FillYourDetailsProvider fillDetailsProvider =
          Provider.of<FillYourDetailsProvider>(context, listen: false);
      fillDetailsProvider.initFunction();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: titleBar(context, "Fill in your details", 60),
        floatingActionButton:
            Consumer2<FillYourDetailsProvider, SheduleDateProvider>(builder:
                (context, fillYourDetailsProvider, sheduleDateProvider, _) {
          return InkWell(
            onTap: () => {Navigator.pop(context)},
            child: SizedBox(
              child: mainBtn(
                isLoading: fillYourDetailsProvider.isLoading,
                context,
                "Proceed",
                false,
                () {
                  sheduleDateProvider.changeInitalTime();
                  fillYourDetailsProvider.proceedFillDetailsFunction(context);
                },
              ),
            ),
          );
        }),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 85),
              child: Consumer2<FillYourDetailsProvider, SheduleDateProvider>(
                  builder: (context, fillYourDetailsProvider,
                      sheduleDateProvider, _) {
                return Column(
                  children: [
                    textFormField("Name", "Enter receiver's name",
                        fillYourDetailsProvider.nameController, () {}),
                    textFormField(
                      "Phone number",
                      "Enter receiver's phone no",
                      fillYourDetailsProvider.phoneController,
                      () {},
                      keyboardType: TextInputType.number,
                    ),
                    textFormField(
                      "Pickup location",
                      "Where will you pick up your order? ",
                      fillYourDetailsProvider.pickupController,
                      () {},
                    ),
                    CustomDropDown(
                      title: "Delivery Centre",
                      selectedValue: fillYourDetailsProvider.selectedValue,
                      itemList: fillYourDetailsProvider.itemList,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // ParcelTextField(
                    //   text: "Parcel tracking no",
                    //   controller:
                    //       fillYourDetailsProvider.trackingControllers[0],
                    //   validatorFunction: () {},
                    //   enableCriteria: false,
                    //   criteria: const [],
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Parcel tracking no",
                          style: TextStyle(
                            fontSize: regular,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    displayAddParcels(
                      fillYourDetailsProvider.widgets,
                    ),
                    outlinedBtn(
                      context,
                      null,
                      Icons.add,
                      () {
                        fillYourDetailsProvider
                            .trackingParcelTextFiledCreator();
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        ));
  }
}
