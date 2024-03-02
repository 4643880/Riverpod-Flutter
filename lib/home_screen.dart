import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_app/main.dart';
import 'dart:developer' as devtools show log;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myStream = ref.watch(fetchStreamProvider);

    return myStream.when(
      data: (data) {
        return Scaffold(
          body: Center(
            child: Text(data.toString()),
          ),
        );
      },
      error: (error, stackTrace) {
        return Text("Something went wrong: $error");
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
