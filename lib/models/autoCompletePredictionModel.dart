class AutoCompletePredictionModel{
  final String? description;
  final StructuredFormatting? structuredFormatting;
  final String? placeId;
  final String? reference;

  AutoCompletePredictionModel({
    this.description,
    this.structuredFormatting,
    this.placeId,
    this.reference
  });

  factory AutoCompletePredictionModel.fromJson(Map<String, dynamic> json){
    return AutoCompletePredictionModel(
      description: json['description'] as String?,
      structuredFormatting: json['structuredFormatting'] != null
        ? StructuredFormatting.fromJson(json['structuredFormatting'])
        : null,
      placeId: json['placeId'] as String?,
      reference: json['reference'] as String?
    );
  }
}

class StructuredFormatting{
  final String? mainText;
  final String? secondaryText;

  StructuredFormatting({
    this.mainText,
    this.secondaryText
  });

  factory StructuredFormatting.fromJson(Map<String, dynamic> json){
    return StructuredFormatting(
      mainText: json['mainText'] as String?,
      secondaryText: json['secondaryText'] as String?
    );
  }
}