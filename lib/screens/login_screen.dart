import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:sports_gear/screens/home_screen.dart';
import 'package:sports_gear/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //  form key
  final _formKey = GlobalKey<FormState>();

  //  editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();


  //  firebase
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {

    // email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regExp = new RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
        if(value!.isEmpty){
          return "Please Enter Your Email";
        }
        //  reg exprassion for email validation
        if(!regExp.hasMatch(value)){
          return "Please Enter a Vaid Email";
        }
        return null;
      },
      onSaved: (value)
      {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      //validator
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return "Password is requerd for Login";
        }
        //  reg exprassion for email validation
        if(!regExp.hasMatch(value)){
          return "Please Enter a Vaid Password(Min 6 Character)";
        }
        return null;
      },
      onSaved: (value)
      {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // loginButton Field
    final loginButton = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          signIn(emailController.text, passwordController.text);
        },
        child: Text("Login",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(
                        height: 200,

                        child: Image.asset(
                            "assets/main.jpg",
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(height: 45,),

                      emailField,
                      SizedBox(height: 25,),
                      passwordField,
                      SizedBox(height: 35,),
                      loginButton,
                      SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text("Don't have an account? "),
                          GestureDetector(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen()));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.blue,
                            ),
                          ),
                          )
                        ],
                      ),
                    ],

                  ),
              ),
            ),
          ),
          
        ),
      ),
    );
  }


  //  login function
  void signIn(String email, String password) async {
    if(!_auth.currentUser!.emailVerified){
      Fluttertoast.showToast(msg: "Email is not verified yet. Please Check your Mail");
    }
    if(_formKey.currentState!.validate() && _auth.currentUser!.emailVerified){
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
            Fluttertoast.showToast(msg: "Login Successful"),
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()))
      }).catchError((e)
      {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

}
