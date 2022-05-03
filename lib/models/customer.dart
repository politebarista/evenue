import 'package:evenue/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer extends User {
  final String id;
  final String lastName;
  final String firstName;
  final String email;
  final String phoneNumber;

  Customer(
    this.id,
    this.lastName,
    this.firstName,
    this.email,
    this.phoneNumber,
  );

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(
        json,
      );

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
