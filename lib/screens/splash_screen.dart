import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sports_gear/screens/home_screen.dart';
import 'package:sports_gear/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  //static const String  routeName = '/splash_screen';

  @override
  Widget build(BuildContext context) {
    gotohome(context);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [

          Center(
            child: Container(
              height: 100,
              width: 100,
              child: Image.asset('assets/sports-logo-png-transparent.png'),
            ),
          ),

          const SizedBox(height: 1),

          Center(
            child: Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/img_223884.png'),
            ),
          ),

          const SizedBox(height: 30),

          Center(
            child: Container(
              height: 30,
              width: 30,
              child: const CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ],
      ),

    );
  }


  Future gotohome(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if(FirebaseAuth.instance.currentUser != null){
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
      //Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route) => false);
    }
  }

}