import 'package:architech/components/processStatus.dart';
import 'package:architech/controllers/formValidator.dart';
import 'package:architech/controllers/providers/orderProvider.dart';
import 'package:architech/pages/login.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/order/orderConfirm.dart';
import 'package:architech/pages/order/orderCriteria.dart';
import 'package:architech/pages/order/orderDetails.dart';
import 'package:architech/pages/order/orderEdit.dart';
import 'package:architech/pages/order/orderSchedule.dart';
import 'package:architech/pages/order/orderTracking.dart';
import 'package:architech/pages/orders.dart';
import 'package:architech/pages/order/orderPlace.dart';
import 'package:architech/pages/profile.dart';
import 'package:architech/pages/signup.dart';
import 'package:architech/pages/support/helpCentre.dart';
import 'package:flutter/material.dart';

// import 'package:architech/config/router.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniDash',
      // home: OrderPlace(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FormValidator()),
          // ChangeNotifierProvider(create: (context) => OrderProvider()),
          // ChangeNotifierProvider(create: (context) => ParcelProvider()),
        ],
        child: OrderPlace(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went Wrong'));
        } else if (snapshot.hasData) {
          return Home();
        } else {
          return Login();
        }
      }
    ),
  );
}
