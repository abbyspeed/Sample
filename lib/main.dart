import 'package:architech/controllers/formValidator.dart';
import 'package:architech/pages/home.dart';
import 'package:architech/pages/login.dart';
import 'package:architech/pages/order/fill_your_details/provider/fill_your_details_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/order/fill_your_details/fill_your_details_screen.dart';
import 'pages/order/order_confirm/provider/order_confirm_provider.dart';
import 'pages/order/pick_your_parcel_criteria/provider/pick_your_parcel_provider.dart';
import 'pages/order/shedule_date/provider/shedule_date_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FormValidator()),
    ChangeNotifierProvider(
      create: (context) => FillYourDetailsProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => PickYourParcelProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SheduleDateProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => OrderConfirmProvider(),
    ),
  ], child: const MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniDash',
      home: ScreenFillYourDetails(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Something went Wrong'));
              } else if (snapshot.hasData) {
                return const Home();
              } else {
                return const Login();
              }
            }),
      );
}
