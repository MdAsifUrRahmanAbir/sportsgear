import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sports_gear/model/user_model.dart';
import 'package:sports_gear/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel logedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
    .collection("users")
    .doc(user!.uid)
    .get()
    .then((value){
      this.logedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sports Gear"),centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(
                height: 180,

                child: Image.asset(
                  "assets/main.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Wellcome Back",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${logedInUser.firstName} ${logedInUser.secondName}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
              ),
              Text(
                "${logedInUser.email}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
              ),
              SizedBox(height: 20,),
              ActionChip(label:
                Text("Logout",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    // logoutt
                    logout(context);
                  },
              ),

            ],
          ),
        ),
      ),

    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen() ));
    Fluttertoast.showToast(msg: "Logout Successfully");
  }
}
