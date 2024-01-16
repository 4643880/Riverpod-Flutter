import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class User {
  final String name;
  final int age;

  const User({
    required this.name,
    required this.age,
  });

  User copyWith({String? name, int? age}) {
    return User(name: name ?? this.name, age: age ?? this.age);
  }
}

class UserNotifier extends StateNotifier<User> {
  // 1: Origional passes value from stateNotifierProvider that is inside main.dart
  // UserNotifier(super.state);

  // 2: Just Like Bloc
  // UserNotifier() : super(const User(name: "Khalid", age: 22));

  // 3: Optional
  // Initial Value is empty, when the constructor will build it will update the state immediately
  UserNotifier() : super(const User(name: "", age: 0)) {
    updateName("Khalid");
    updateAge("22");
  }

  // will update name
  void updateName(String n) {
    state = state.copyWith(name: n);
  }

  // will update age
  void updateAge(String a) {
    state = state.copyWith(age: int.tryParse(a));
  }
}
