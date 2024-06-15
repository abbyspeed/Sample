class ParcelModelList {
  String? name;
  List<String>? criteriaList;

  ParcelModelList({this.name, this.criteriaList});

  // Method to convert a ParcelModelList instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'criteriaList': criteriaList,
    };
  }

  // Factory method to create a ParcelModelList instance from JSON
  factory ParcelModelList.fromJson(Map<String, dynamic> json) {
    return ParcelModelList(
      name: json['name'],
      criteriaList: json['criteriaList'] != null
          ? List<String>.from(json['criteriaList'])
          : null,
    );
  }
}
