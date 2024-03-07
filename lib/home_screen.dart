import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_app/main.dart';
import 'dart:developer' as devtools show log;
//================================================================
// Basic Code of ConsumerStatefulWidget
//================================================================

// class HomeScreenWithStatefulConsumer extends ConsumerStatefulWidget {
//   const HomeScreenWithStatefulConsumer({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenWithStatefulConsumerState()
// }

// class _HomeScreenWithStatefulConsumerState extends ConsumerState<HomeScreenWithStatefulConsumer> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class HomeScreenWithStatefulConsumer extends ConsumerStatefulWidget {
  const HomeScreenWithStatefulConsumer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HomeScreenWithStatefulConsumerState();
}

class _HomeScreenWithStatefulConsumerState
    extends ConsumerState<HomeScreenWithStatefulConsumer> {
  String? userId = "1";

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(fetchUserProvider(userId ?? "1"));

    return user.when(
      data: (data) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onSubmitted: (value) {
                    ref.watch(fetchUserProvider(value));
                    userId = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
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
