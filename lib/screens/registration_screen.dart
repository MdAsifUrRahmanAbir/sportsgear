import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sports_gear/model/user_model.dart';
import 'package:sports_gear/screens/login_screen.dart';
import 'package:sports_gear/screens/home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  //  Firebase auth
  final _auth = FirebaseAuth.instance;

  //  form key
  final _formKey = GlobalKey<FormState>();
  //  editing controller
  final firstNameEditingController = new TextEditingController();
  final secondtNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();




  @override
  Widget build(BuildContext context) {

    // First Name field
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      //validator:
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return "Enter Your First Name";
        }
        //  reg exprassion for name validation
        if(!regExp.hasMatch(value)){
          return "Please Enter a Vaid Name[Min 3 Character]";
        }
        return null;
      },
      onSaved: (value)
      {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Second Name field
    final secondNameField = TextFormField(
      autofocus: false,
      controller: secondtNameEditingController,
      keyboardType: TextInputType.name,
      //validator:
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return "Enter Your Second Name";
        }
        //  reg exprassion for name validation
        if(!regExp.hasMatch(value)){
          return "Please Enter a Vaid Name[Min 3 Character]";
        }
        return null;
      },
      onSaved: (value)
      {
        secondtNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Second Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // email Name field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      //validator:
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
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: " Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      //validator:
      validator: (value) {
        RegExp regExp = new RegExp(r'^.{6,}$');
        if(value!.isEmpty){
          return "Password is requerd for Login";
        }
        //  reg exprassion for password validation
        if(!regExp.hasMatch(value)){
          return "Please Enter a Vaid Password(Min 6 Character)";
        }
        return null;
      },
      onSaved: (value)
      {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      //validator:
      validator: (value) {
        if(confirmPasswordEditingController.text != passwordEditingController.text){
          return "Password don't match";
        }
        return null;
      },
      onSaved: (value)
      {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // singUpButton Field
    final signUpButton = Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signup(emailEditingController.text, passwordEditingController.text);
        },
        child: Text("SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),


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

                    firstNameField,
                    SizedBox(height: 25,),
                    secondNameField,
                    SizedBox(height: 25,),
                    emailField,
                    SizedBox(height: 25,),
                    passwordField,
                    SizedBox(height: 25,),
                    confirmPasswordField,
                    SizedBox(height: 35,),
                    signUpButton,
                  ],

                ),
              ),
            ),
          ),

        ),
      ),
    );
  }

  void signup(String email, String password) async {
    if(_formKey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
            postDetailsToFireStore(),
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFireStore() async {
    //  calling our firestore
    //  calling our user model
    //  sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    _auth.currentUser!.sendEmailVerification();

    UserModel userModel = UserModel();

    //  writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.secondName = secondtNameEditingController.text;

    await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account Created and a mail send for varification");
    
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
  }
}
