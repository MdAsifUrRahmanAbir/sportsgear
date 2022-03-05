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


  /// this is home screen
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

    final sportShop = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

        },
        child: Text("Sports Shop",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final blog = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

        },
        child: Text("Blog / News",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final booking = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

        },
        child: Text("Booking",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final hiring = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

        },
        child: Text("Hiring",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final about = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

        },
        child: Text("About",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final profile = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));

        },
        child: Text("Profile",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Sports Gear"),centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
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
                SizedBox(height: 20,),
                Text(
                  "Wellcome to Sports Gear",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10,),
                Text(
                  "Hi ${logedInUser.firstName} ${logedInUser.secondName}!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                ),
                Text(
                  "${logedInUser.email}",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                ),
                SizedBox(height: 15,),

                sportShop,
                SizedBox(height: 10,),
                hiring,
                SizedBox(height: 10,),
                booking,
                SizedBox(height: 10,),
                blog,
                SizedBox(height: 10,),
                about,
                SizedBox(height: 10,),
                profile,
                SizedBox(height: 15,),
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
      ),

    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen() ));
    Fluttertoast.showToast(msg: "Logout Successfully");
  }
}
