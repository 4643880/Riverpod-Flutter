import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_practice_app/home_screen.dart';
import 'package:riverpod_practice_app/user.dart';
import 'package:http/http.dart' as http;

//=====================================
// Future Provider
//=====================================
// Alternative of Future Builder

final fetchUserProvider = FutureProvider((ref) {
  return UserRepo().fetchUserData();
});

class UserRepo {
  Future<MyUser> fetchUserData() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    return MyUser.fromJson(jsonDecode(res.body));
  }
}

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}


// 01:13:54