import 'package:architech/components/customDropdown.dart';
import 'package:architech/components/form.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/controllers/formValidator.dart';
import 'package:architech/models/orderModel.dart';
import 'package:architech/models/parcelModel.dart';
import 'package:architech/pages/order/orderCriteria.dart';
import 'package:architech/pages/order/orderSchedule.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPlace extends StatefulWidget{
  const OrderPlace({super.key});

  @override
  State<OrderPlace> createState() => _OrderPlace();
}

class _OrderPlace extends State<OrderPlace>{
  _OrderPlace(){
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
    trackingControllers = [];

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

  void createOrder(){
    setState(() {
      order.name = nameController.text;
      order.phoneNumber = phoneController.text;
      order.pickupLocation = pickupController.text;
      order.deliveryCentre = centreController.text;
      
      for(var i = 0; i<trackingControllers.length; i++){
        ParcelModel pm = ParcelModel(trackingControllers[i].text);

        order.parcels.add(pm);
      }
    });
  }

  Widget displayAddParcels(widgets){
    if(widgets != null){
      return LimitedBox(
        maxHeight: 400,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widgets.length,
          itemBuilder: (context, index){
            return Container(
              child: widgets[index]
            );
          } 
        ),
      );
    }else{
      return const SizedBox(width: 0, height: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormValidator>;
    trackingControllers.add(trackingController);

    return Scaffold(
      appBar: titleBar(context, "Fill in your details", 60),
      floatingActionButton: InkWell(
        onTap: () => {
          Navigator.pop(context)
        },
        child: SizedBox(
          child: mainBtn(context, "Proceed", false, (){
            // createOrder();
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderSchedule(order: order)));
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
                textFormField("Name", "Enter receiver's name", nameController, (){}),
                textFormField("Phone number", "Enter receiver's phone no", phoneController, (){}),
                textFormField("Pickup location", "Where will you pick up your order? ", pickupController, (){}),
                CustomDropDown(title: "Delivery Centre", selectedValue: selectedValue, itemList: itemList),
                const SizedBox(height: 30),
                textFormField("Parcel tracking no", "Enter tracking no", trackingControllers[0], (){}),
                displayAddParcels(widgets),
                outlinedBtn(context, null, Icons.add, (){
                  setState(() {
                    trackingControllers.add(TextEditingController());
                    widgets.add(
                      textFormField(null, "Enter tracking no", trackingControllers[trackingControllers.length-1], (){})
                    );
                  });
                }),
              ],
            ),
          ),
        ),
      )
    );
  }
}