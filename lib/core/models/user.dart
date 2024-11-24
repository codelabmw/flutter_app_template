import 'dart:convert';

import 'package:flutter/widgets.dart';

class User {
  final String uuid;
  final String? email;
  final String? name;
  final bool verified;

  User({
    required this.uuid,
    this.email,
    this.name,
    required this.verified,
  });

  User copyWith({
    String? uuid,
    ValueGetter<String?>? email,
    ValueGetter<String?>? name,
    bool? verified,
  }) {
    return User(
      uuid: uuid ?? this.uuid,
      email: email != null ? email() : this.email,
      name: name != null ? name() : this.name,
      verified: verified ?? this.verified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'email': email,
      'name': name,
      'verified': verified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uuid: map['uuid'] ?? '',
      email: map['email'],
      name: map['name'],
      verified: map['verified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uuid: $uuid, email: $email, name: $name, verified: $verified)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.uuid == uuid &&
        other.email == email &&
        other.name == name &&
        other.verified == verified;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^ email.hashCode ^ name.hashCode ^ verified.hashCode;
  }
}
