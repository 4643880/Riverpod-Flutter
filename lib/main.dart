import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_app/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_practice_app/user.dart';

//=====================================
// Future Provider With Family
//=====================================

final fetchUserProvider =
    FutureProvider.family.autoDispose((ref, String input) {
  return UserRepo().fetchUserData(userId: input);
});

class UserRepo {
  Future<MyUser> fetchUserData({required String userId}) async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'),
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
      home: const HomeScreenWithStatefulConsumer(),
    );
  }
}


// 01:18:18