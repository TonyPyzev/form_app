import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContactFormData extends Equatable {
  final String name;
  final String email;
  final String message;

  const ContactFormData(
    this.name,
    this.email,
    this.message,
  );

  @override
  List<Object?> get props => [
        name,
        email,
        message,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'message': message,
    };
  }

  factory ContactFormData.fromMap(Map<String, dynamic> map) {
    return ContactFormData(
      map['name'] as String,
      map['email'] as String,
      map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactFormData.fromJson(String source) =>
      ContactFormData.fromMap(json.decode(source) as Map<String, dynamic>);
}
