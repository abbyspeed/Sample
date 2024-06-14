import 'package:architech/components/logos.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/bottomAppBarModel.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:architech/pages/login.dart';

// class Home extends StatelessWidget{
//   // const Home({super.key, required this.email});
//   const Home({super.key});

//   // final String email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: topBar(context),
//       bottomNavigationBar: bottomBar(context),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Welcome, User",
//               style: TextStyle(
//                 fontSize: mainTitle
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: const Column(
//                 children: [
//                   Text(
//                     "You have no updates yet"
//                   ),
//                 ],
//               )
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// For test purpose
class Home extends StatelessWidget{
  // const Home({super.key, required this.email});
  const Home({super.key});

  // final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: bottomBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, User",
              style: TextStyle(
                fontSize: mainTitle
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Column(
                  children: [
                    Text("You have no updates yet"),
                  ],
                )),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              icon: Icon(Icons.lock_open, size: 32),
              label: Text(
                'Sign out',
                style: TextStyle(fontSize: 24),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login())
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// For test purpose
// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser!;

//     return Scaffold(
//       appBar: topBar(context),
//       bottomNavigationBar: bottomBar(context),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Welcome, User",
//               style: TextStyle(fontSize: mainTitle),
//             ),
//             Text(
//               user.email!,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
//             ),
//             Container(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: const Column(
//                   children: [
//                     Text("You have no updates yet"),
//                   ],
//                 )),
//             ElevatedButton.icon(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size.fromHeight(50),
//               ),
//               icon: Icon(Icons.lock_open, size: 32),
//               label: Text(
//                 'Sign out',
//                 style: TextStyle(fontSize: 24),
//               ),
//               onPressed: () => FirebaseAuth.instance.signOut(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
