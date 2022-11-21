import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tuiter/firebase_options.dart';
import 'package:tuiter/services/firebase_service.dart';

import 'home.dart';
import 'login_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late String status;

  @override
  void initState() {
    super.initState();
    status = "Initializing...";
    workFlow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(status)]),
      ),
    );
  }

  Future<void> workFlow() async {
    //Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    setState(() {
      status = "Firebase initialized";
    });

    //Check if user is already logged
    if (FirebaseService.instance.user == null) {
      //Go to Login
      if (!mounted) return;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      //Go to Home
      if (!mounted) return;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
}
