import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice_app/main.dart';
import 'package:riverpod_practice_app/user.dart';
import 'dart:developer' as devtools show log;

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
    // final name2 = ref.read(nameProvider); // use it outside of stateless e.g init or myFunc() or to update value
    final user =
        ref.watch(userProvider); // use it to contineously listen the values
    final userSelect = ref.watch(userProvider.select((value) =>
        value.name)); // user it to rebuild only when the name will change
    // devtools.log("Check Rebuild");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                // ref.read(nameProvider1.notifier).update((state) {
                //   return value;
                // });
                // devtools.log(value);
                List values = value.split(',').toList();
                // devtools.log(values.toString());
                ref.read(userProvider.notifier).updateName(values[0]);
                ref.read(userProvider.notifier).updateAge(values[1]);
              },
            ),
            Text("${user.name}   ${user.age}"),
            const SizedBox(
              height: 20,
            ),
            Text(userSelect),
          ],
        ),
      ),
    );
  }
}
