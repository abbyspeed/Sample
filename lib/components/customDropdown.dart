import 'package:architech/config/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDropDown extends StatefulWidget{
  CustomDropDown({super.key, required this.title, required this.selectedValue, required this.itemList});

  String title, selectedValue;
  List<String> itemList;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: regular,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 140,
            child: DropdownButtonFormField(
              value: widget.selectedValue,
              items: widget.itemList.map((e) => DropdownMenuItem( 
                value: e,
                child: Text(
                  e,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal
                  )
                ))
              ).toList(),
              onChanged: (val){
                setState(() {
                  widget.selectedValue = val as String;
                });
              },
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: greyColour,
                size: 28,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 15, 10, 15),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2)
                ),
                border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(4))
              ),
            ),
          ),
        ]
      ),
    );
  }
}