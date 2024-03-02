import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_app/main.dart';
import 'package:riverpod_practice_app/user.dart';
import 'dart:developer' as devtools show log;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(fetchUserProvider);

    return user.when(
      data: (data) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.name ?? "Data Nhi ha."),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
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
