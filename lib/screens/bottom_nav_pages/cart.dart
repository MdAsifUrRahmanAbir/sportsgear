import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../amdani/check_out.dart';
import '../widgets/fetchProducts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();

}

class _CartState extends State<Cart> {
   double price = 0;
   String? stPrice;

   @override
  void initState() {
    super.initState();
  }
   Future addToOrder(String name, String Price, String img) async {
     final FirebaseAuth _auth = FirebaseAuth.instance;
     var currentUser = _auth.currentUser;
     CollectionReference _collectionRef =
     FirebaseFirestore.instance.collection("users-order-items");
     return _collectionRef
         .doc(currentUser!.email)
         .collection("items")
         .doc()
         .set({
       "name": name,
       "price": price,
       "images": img,
     }).then((value) => print("Added to order"));
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users-cart-items')
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection("items")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something is wrong"),
              );
            }

            return Column(
              children: [
                Container(
                  height: 500,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount:
                      snapshot.data == null ? 0 : snapshot.data!.docs.length,
                      itemBuilder: (_, index) {
                        DocumentSnapshot _documentSnapshot =
                        snapshot.data!.docs[index];



                            if(snapshot.data == null){
                              price= 0;
                            }else{
                              stPrice = _documentSnapshot['price'].toString();
                              price = price + double.parse(stPrice!);
                            }

                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: Image.network(_documentSnapshot['images'][0], width: 140,),
                            title: Text(
                              "TK ${_documentSnapshot['price']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                            subtitle: Text(
                              " ${_documentSnapshot['name']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, color: Colors.red),
                            ),
                            trailing: GestureDetector(
                              child: CircleAvatar(
                                child: Icon(Icons.remove_circle),
                              ),
                              onTap: () {

                                stPrice = _documentSnapshot['price'].toString();
                                price = price - double.parse(stPrice!);

                                FirebaseFirestore.instance
                                    .collection('users-cart-items')
                                    .doc(FirebaseAuth.instance.currentUser!.email)
                                    .collection("items")
                                    .doc(_documentSnapshot.id)
                                    .delete();
                              },
                            ),
                          ),
                        );
                      }),
                ),

                Spacer(),
                ElevatedButton(
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
                                onPressed: () {
                                  Navigator.pop(context);
                                },	 // function used to perform after pressing the button
                                child: Text('CANCEL'),
                              ),
                              FlatButton(
                                textColor: Colors.black,
                                onPressed: () {
                                  // for(int i=0; i<snapshot.data!.docs.length ; i++){
                                  //   DocumentSnapshot _documentSnapshot =
                                  //   snapshot.data!.docs[i];
                                  //   addToOrder(_documentSnapshot['name'], _documentSnapshot['price'], _documentSnapshot['images'][0]);
                                  // }
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
                    "BUY",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    elevation: 3,
                  ),
                ),
              ],
            );
          },
        ),
        //child: fetchData("users-cart-items"),
      ),
    );
  }
}
