import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../amdani/check_out.dart';
import '../widgets/fetchProducts.dart';

class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();

}

class _OrderState extends State<Order> {
   double price = 0;
   String? stPrice;

   @override
  void initState() {



    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users-order-items')
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
                          ),
                        );
                      }),
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
