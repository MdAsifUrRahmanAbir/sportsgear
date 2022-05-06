import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sports_gear/drawer_screen/about_screen.dart';
import 'package:sports_gear/drawer_screen/developers_screen.dart';
import 'package:sports_gear/drawer_screen/faq_screen.dart';
import 'package:sports_gear/drawer_screen/objection_Screen.dart';
import 'package:sports_gear/drawer_screen/terms_and_conditon_screen.dart';
import 'package:sports_gear/model/user_model.dart';
import 'package:sports_gear/drawer_screen/profile.dart';
import 'package:sports_gear/screens/home_screens_widget_view/blog_screen.dart';
import 'package:sports_gear/screens/home_screens_widget_view/book_field_screen.dart';
import 'package:sports_gear/screens/home_screens_widget_view/buy_ticket_screen.dart';
import 'package:sports_gear/screens/home_screens_widget_view/hire_player_screen.dart';
import 'package:sports_gear/screens/home_screens_widget_view/news_screen.dart';
import 'package:sports_gear/screens/login_screen.dart';

import 'bottom_nav_controller.dart';
import 'home_screens_widget_view/hire_coach_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel logedInUser = UserModel();
  String imgUrl = 'assets/img.jpg';

  /// this is home screen
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
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
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BottomNavController()));
        },
        child: Text(
          "Sports Shop",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
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
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BlogScreen()));
        },
        child: Text(
          "Blog",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final news = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen()));
        },
        child: Text(
          "News",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final bookField = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FieldScreen()));
        },
        child: Text(
          "Book Venue",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    final bookTicket = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TicketScreen()));
        },
        child: Text(
          "Buy Ticket",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final hiringPlayer = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PlayerScreen()));
        },
        child: Text(
          "Hire Player",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    final hiringCoach = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CoachScreen()));
        },
        child: Text(
          "Hire Coach",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Sports Gear"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 180,
                child: Image.asset(
                  "assets/cover.jpg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Wellcome to Sports Gear",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              sportShop,
              SizedBox(
                height: 10,
              ),
              hiringPlayer,
              SizedBox(
                height: 10,
              ),
              hiringCoach,
              SizedBox(
                height: 10,
              ),
              bookField,
              SizedBox(
                height: 10,
              ),
              bookTicket,
              SizedBox(
                height: 10,
              ),
              news,
              SizedBox(
                height: 10,
              ),
              blog,
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      drawer: _myDrawer(context),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
    Fluttertoast.showToast(msg: "Logout Successfully");
  }

  _myDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/cover.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CircleAvatar(
                child:  Image.asset(imgUrl, fit: BoxFit.cover, width: double.infinity,),
              ),
            ),
            accountName:
            Text('${logedInUser.firstName} ${logedInUser.secondName}', style: TextStyle(color: Colors.black),),
            accountEmail: Text('${logedInUser.email}',style: TextStyle(color: Colors.black),),
          ),
          ListTile(
            leading: Icon(Icons.person_rounded),
            title: Text("Profile"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            leading: Icon(Icons.sticky_note_2_outlined),
            title: Text("About"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
            },
          ),

          ListTile(
            leading: Icon(Icons.question_answer_outlined),
            title: Text("FAQ"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FAQScreen()));
            },
          ),

          ListTile(
            leading: Icon(Icons.rule_sharp),
            title: Text("Terms and Conditions"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TmCnScreen()));
            },
          ),

          ListTile(
            leading: Icon(Icons.supervised_user_circle_sharp),
            title: Text("Developer Team"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DeveloperScreen()));
            },
          ),

          ListTile(
            leading: Icon(Icons.record_voice_over_rounded),
            title: Text("Report"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ObjectionScreen()));
            },
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out!"),
            onTap: () {
              logout(context);
            },
          ),

        ],
      ),
    );
  }
}
