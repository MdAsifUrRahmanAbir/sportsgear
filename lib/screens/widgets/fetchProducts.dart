import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget fetchData (String collectionName){

  double price = 0;
  String? stPrice;

  return StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection(collectionName)
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

      return ListView.builder(
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
                  "\$ ${_documentSnapshot['price']}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
                subtitle: Text(
                  "\$ ${_documentSnapshot['name']}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
                trailing: GestureDetector(
                  child: CircleAvatar(
                    child: Icon(Icons.remove_circle),
                  ),
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection(collectionName)
                        .doc(FirebaseAuth.instance.currentUser!.email)
                        .collection("items")
                        .doc(_documentSnapshot.id)
                        .delete();
                  },
                ),
              ),
            );
          });
    },
  );
}