// To parse this JSON data, do
//
//     final exampleModel = exampleModelFromJson(jsonString);

import 'dart:convert';

ExampleModel exampleModelFromJson(String str) => ExampleModel.fromJson(json.decode(str));

String exampleModelToJson(ExampleModel data) => json.encode(data.toJson());

class ExampleModel {
  String? name;
  int? number;

  ExampleModel({
    this.name,
    this.number,
  });

  ExampleModel copyWith({
    String? name,
    int? number,
  }) =>
      ExampleModel(
        name: name ?? this.name,
        number: number ?? this.number,
      );

  factory ExampleModel.fromJson(Map<String, dynamic> json) => ExampleModel(
    name: json["name"],
    number: json["number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "number": number,
  };
}
