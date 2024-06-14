import 'package:architech/components/form.dart';
import 'package:architech/components/labels.dart';
import 'package:architech/components/navBars.dart';
import 'package:architech/config/theme.dart';
import 'package:architech/models/lists.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';


class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
        );
      },
      child: Text('Logout'),
    );
  }
 }

class Profile extends StatefulWidget{
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(context),
      bottomNavigationBar: bottomBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Stack(
                    children: [
                      Container(
                        width: 95,
                        height: 95,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                      Positioned(
                        bottom: -8,
                        right: -8,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(50),
                            ),
                            color: Colors.white,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.add_a_photo, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Full Name"
                ),
              ),
              Center(child: status("User", 0)),
              const SizedBox(height: 10),
              Text(
                "Personal Details",
                style: TextStyle(
                  color: greyColour,
                  fontSize: 16,
                )
              ),
              const SizedBox(height: 10),
              duoTextField("Email address", "username@gmail.com", false, emailController),
              duoTextField("Password", "*****", true, passwordController),
              const SizedBox(height: 20),
              Text(
                "Preferences",
                style: TextStyle(
                  color: greyColour,
                  fontSize: 16,
                )
              ),
              const SizedBox(height: 10),
              fullBtn(Icons.wallet, "Languages", label[1]),
              fullBtn(Icons.wallet, "Settings", label[2]),
              const SizedBox(height: 30),
              LogoutButton(),
              Center(child: textLink(context, "Delete account", "", greyColour))
            ],
          ),
        ),
      ),
    );
  }
}
