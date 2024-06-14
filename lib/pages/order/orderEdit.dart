import 'package:architech/components/customDropdown.dart';
import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/controllers/formValidator.dart';
import 'package:architech/models/orderModel.dart';
import 'package:architech/models/parcelModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderEdit extends StatefulWidget{
  const OrderEdit({super.key});

  @override
  State<OrderEdit> createState() => _OrderEdit();
}

class _OrderEdit extends State<OrderEdit>{
  _OrderEdit(){
    selectedValue = itemList[0];
  }
  
  OrderModelTest order = OrderModelTest();
  String selectedValue = "";

  final itemList = ["Pick one", "OPC", "CPP", "ASN"];
  late List<Widget> widgets;
  late List<TextEditingController> trackingControllers;

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController pickupController;
  late TextEditingController trackingController;
  late TextEditingController centreController;

  @override
  void initState(){
    super.initState();
    widgets = [];
    trackingControllers = [
      TextEditingController(),
      TextEditingController()
    ];

    nameController = TextEditingController();
    phoneController = TextEditingController();
    pickupController = TextEditingController();
    trackingController = TextEditingController();
    centreController = TextEditingController();
  }
  
  @override
  void dispose(){
    widgets = [];
    trackingControllers = [];
    order.parcels = [];

    nameController.dispose();
    phoneController.dispose();
    pickupController.dispose();
    for(TextEditingController trackingList in trackingControllers){
      trackingList.dispose();
    }
    centreController.dispose();
    super.dispose();
  }

  void updateOrder(){
    setState(() {
      order.name = nameController.text;
      order.phoneNumber = phoneController.text;
      order.pickupLocation = pickupController.text;
      order.deliveryCentre = centreController.text;
      
      // for(var i = 0; i<trackingControllers.length; i++){
      //   ParcelModel pm = ParcelModel(trackingControllers[i].text);

      //   order.parcels.add(pm);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final state = context.watch<FormValidator>;
    trackingControllers.add(trackingController);

    return Scaffold(
      appBar: titleBar(context, "Edit Order ${order.orderId}", 90),
      floatingActionButton: InkWell(
        onTap: () => {
          Navigator.pop(context)
        },
        child: SizedBox(
          child: mainBtn(context, "Proceed", false, (){
            // createOrder();
            // Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSchedule(order: order)));
          })
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 85),
            child: Column(
              children: [
                // textFormField("Name", "Enter receiver's name", nameController, state.validateText.message),
                textFormField("Name", order.name, nameController, (){}),
                textFormField("Phone number", order.phoneNumber, phoneController, (){}),
                textFormField("Pickup location", order.pickupLocation, pickupController, (){}),
                CustomDropDown(title: "Delivery Centre", selectedValue: selectedValue, itemList: itemList),
                const SizedBox(height: 30),
                LimitedBox(
                  maxHeight: 300,
                  child: ListView.builder(
                    itemCount: order.parcels.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: Text("Parcel ${index + 1}")
                          ),
                          textFormField(null, order.parcels[index].trackingNo, trackingControllers[index], (){})
                        ] 
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}