import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_app/main.dart';
import 'package:riverpod_practice_app/user.dart';
import 'dart:developer' as devtools show log;

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Getting Values & using it in ui
    final user = ref.watch(userChangeNotifierProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                List values = value.split(',').toList();
                // devtools.log(values.toString());

                // Setting Values
                ref.read(userChangeNotifierProvider.notifier).updateName(
                      values[0],
                    );
                ref.read(userChangeNotifierProvider.notifier).updateAge(
                      values[1],
                    );
              },
            ),
            // Displaying Values
            Text("${user.user.name}   ${user.user.age}"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
