import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sports_gear/screens/amdani/pc-profile.dart';

class PlayerScreen extends StatefulWidget {
   PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late List _player = [];

  late var _firestoreInstance = FirebaseFirestore.instance;

   fetchPlayers() async {
     QuerySnapshot qn = await _firestoreInstance.collection("players").get();
     setState(() {
       for (int i = 0; i < qn.docs.length; i++) {
         _player.add({
           "player-name": qn.docs[i]["player-name"],
           "player-cat": qn.docs[i]["player-cat"],
           "player-contact": qn.docs[i]["player-contact"],
           "player-image": qn.docs[i]["player-image"],
         });
         
         print(qn.docs[i]["player-name"]);
       }
     });

     return qn.docs;
   }

  @override
  void initState() {
    fetchPlayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Players'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => const Divider(height: 3),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _player.length,
            itemBuilder: (context, index){
              return Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.withOpacity(.4)
                ),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                        child: Image.network(_player[index]["player-image"], height: 200,width: 160, fit: BoxFit.fill,)),
                    SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_player[index]["player-name"]),
                        Text(_player[index]["player-contact"]),
                        Text(_player[index]["player-cat"]),
                        Spacer(),
                        MaterialButton(
                            onPressed: (){

                              String name = _player[index]["player-name"];
                              String img = _player[index]["player-image"];
                              String cat = _player[index]["player-cat"];
                              String contact = _player[index]["player-contact"];

                              Navigator.push(context, MaterialPageRoute(builder: (context)=> PCProfile(
                                img: img,
                                name: name,
                                cat: cat,
                                contact: contact,
                              )));


                            },
                          height: 20,
                          minWidth: 150,
                          elevation: 2,
                          color: Colors.amberAccent,
                          child: Text('View'),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }
        ),
      )
    );
  }
}
