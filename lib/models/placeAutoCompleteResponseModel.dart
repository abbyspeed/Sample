import 'dart:convert';

import 'package:architech/models/autoCompletePredictionModel.dart';

class PlaceAutoCompleteResponseModel{
  PlaceAutoCompleteResponseModel({this.status, this.predictions});

  final String? status;
  final List<AutoCompletePredictionModel>? predictions;

  factory PlaceAutoCompleteResponseModel.fromJson(Map<String, dynamic> json){
    return PlaceAutoCompleteResponseModel(
      status: json['status'] as String?,
      predictions: json['predictions'] != null
        ? json['predictions'].map<AutoCompletePredictionModel>((json) => AutoCompletePredictionModel.fromJson(json)).toList()
        : null
    );
  }

  static PlaceAutoCompleteResponseModel parsedAutoCompleteResult(String responseBody){
    final parsed = json.decode(responseBody).cast<String, dynamic>();

    return PlaceAutoCompleteResponseModel.fromJson(parsed);
  }
}