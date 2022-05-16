import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../amdani/check_out.dart';
import '../widgets/fetchProducts.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  double price = 0;
  String? stPrice;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: fetchData("users-favourite-items"),
      ),

      bottomNavigationBar: SizedBox(
        height: 80,
        child: ElevatedButton(
          onPressed: () {


            showDialog(context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text('BUY NOW'), // To display the title it is optional
                    content: Text('Total Price: $price'), // Message which will be pop up on the screen
                    // Action widget which will provide the user to acknowledge the choice
                    actions: [
                      FlatButton(		 // FlatButton widget is used to make a text to work like a button
                        textColor: Colors.black,
                        onPressed: () {},	 // function used to perform after pressing the button
                        child: Text('CANCEL'),
                      ),
                      FlatButton(
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckOutScreen()));
                        },
                        child: Text('BUY'),
                      ),
                    ],
                  );
                }
            );
          },
          child: Text(
            "Want to BUY NOW?",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            elevation: 3,
          ),
        ),
      ),
    );
  }
}
