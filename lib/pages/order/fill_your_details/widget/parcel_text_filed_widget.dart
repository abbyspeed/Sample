import 'package:architech/config/theme.dart';
import 'package:architech/pages/order/pick_your_parcel_criteria/pick_your_parcel_criteria.dart';
import 'package:flutter/material.dart';

class ParcelTextField extends StatefulWidget {
  ParcelTextField(
      {super.key,
      this.text,
      required this.controller,
      required this.validatorFunction,
      required this.enableCriteria,
      required this.criteria,
      required this.indexSelected});
  String? text;
  TextEditingController controller;
  Function validatorFunction;
  bool enableCriteria = false;
  List<String> criteria;
  int indexSelected;

  @override
  State<ParcelTextField> createState() => _ParcelTextField();
}

class _ParcelTextField extends State<ParcelTextField> {
  List<String> selectedCriteria = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        widget.text != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    widget.text!,
                    style: TextStyle(
                      fontSize: regular,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            : const SizedBox(
                height: 0,
              ),
        TextFormField(
          validator: (value) => widget.validatorFunction(value),
          controller: widget.controller,
          obscureText: false,
          enableSuggestions: false,
          autocorrect: true,
          cursorColor: primaryColour,
          decoration: InputDecoration(
              hintText: "Enter tracking no",
              hintStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              focusedBorder:
                  const OutlineInputBorder(borderSide: BorderSide(width: 2)),
              border: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 1, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(4))),
          keyboardType: TextInputType.name,
          onChanged: (value) {
            setState(() {
              if (widget.controller.text.isEmpty) {
                widget.enableCriteria = false;
              } else {
                widget.enableCriteria = true;
              }
            });
          },
        ),
        const SizedBox(height: 5),
        Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Criteria"),
                const Spacer(),
                SizedBox(
                  width: 230,
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.criteria.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                          right: 5,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
                        child: Text(widget.criteria[index].toString()),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                widget.controller.text.isNotEmpty
                    ? InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ScreenPickYourParcelCriteria(
                                parcelName: widget.controller.text,
                                index: widget.indexSelected,
                                criteria: widget.criteria,
                              ),
                            ),
                          );
                        },
                        child: selectedCriteria.isNotEmpty
                            ? ListView.builder(
                                itemCount: selectedCriteria.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: secondaryColour,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      selectedCriteria[index],
                                    ),
                                  );
                                })
                            : const Icon(Icons.add_box),
                      )
                    : Icon(
                        Icons.add_box,
                        color: lightGrey,
                      )
              ],
            ))
      ]),
    );
  }
}
