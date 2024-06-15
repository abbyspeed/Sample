import 'package:flutter/material.dart';

Widget displayAddParcels(List<Widget> widgets) {
  if (widgets != null) {
    return LimitedBox(
      maxHeight: 500,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widgets.length,
          itemBuilder: (context, index) {
            return Container(child: widgets[index]);
          }),
    );
  } else {
    return const SizedBox(width: 0, height: 0);
  }
}
