import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  String? name;
  @JsonKey(name: "addr1")
  String? addressLine1;
  @JsonKey(name: "city")
  String? addressCity;
  @JsonKey(name: "state")
  String? addressState;

  Person(
      this.name, this.addressLine1, this.addressCity, this.addressState);

  factory Person.fromJson(Map<String, dynamic> json) =>
    _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}