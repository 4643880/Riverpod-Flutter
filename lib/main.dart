import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:riverpod_practice_app/home_screen.dart';
import 'package:http/http.dart' as http;

//=====================================
// Stream Provider
//=====================================
// Alternative of Stream Builder

final fetchStreamProvider = StreamProvider((ref) {
  Stream<int> getSeconds() async* {
    for (int i = 0; i <= 10; i++) {
      yield i;
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  return getSeconds();
});

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


// 01:18:18