import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_app/main.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer(
//         builder: (context, ref, child) {
//           return Center(
//             child: Text(ref.watch(nameProvider)),
//           );
//         },
//       ),
//     );
//   }
// }

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name1 = ref.watch(nameProvider1);
    // final name2 = ref.read(nameProvider); // use it outside of stateless e.g init or myFunc()

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                ref.read(nameProvider1.notifier).update((state) {
                  return value;
                });
              },
            ),
            Text(name1 ?? ""),
          ],
        ),
      ),
    );
  }
}
