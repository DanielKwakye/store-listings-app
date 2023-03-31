import 'package:json_annotation/json_annotation.dart';

part 'animal_model.g.dart';

@JsonSerializable()
class AnimalModel {
  
  final String? url;
  AnimalModel({this.url});


  /// Connect the generated [_$AnimalModelFromJson] function to the `fromJson`
  /// factory.
  factory AnimalModel.fromJson(Map<String, dynamic> json) => _$AnimalModelFromJson(json);

  /// Connect the generated [_$AnimalModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AnimalModelToJson(this);
  
}