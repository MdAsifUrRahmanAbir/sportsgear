import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:sports_gear/screens/amdani/pc-profile.dart';
import 'package:sports_gear/screens/widgets/show_snackBar.dart';

class CoachScreen extends StatefulWidget {
  CoachScreen({Key? key}) : super(key: key);

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  late List _coach = [];

  late var _firestoreInstance = FirebaseFirestore.instance;

  fetchPlayers() async {
    QuerySnapshot qn = await _firestoreInstance.collection("coaches").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _coach.add({
          "coach-name": qn.docs[i]["coach-name"],
          "coach-cat": qn.docs[i]["coach-cat"],
          "coach-contact": qn.docs[i]["coach-contact"],
          "coach-image": qn.docs[i]["coach-image"],
        });

        print(qn.docs[i]["coach-name"]);
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
          title: Text('Coaches'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) => const Divider(height: 3),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _coach.length,
              itemBuilder: (context, index){
                String cEmail = _coach[index]["coach-contact"];
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
                          child: Image.network(_coach[index]["coach-image"], height: 200,width: 150, fit: BoxFit.fill,)),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_coach[index]["coach-name"]),
                          Text(_coach[index]["coach-contact"]),
                          Text(_coach[index]["coach-cat"]),
                          Spacer(),
                          MaterialButton(
                            onPressed: () {
                              String name = _coach[index]["coach-name"];
                              String img = _coach[index]["coach-image"];
                              String cat = _coach[index]["coach-cat"];
                              String contact = _coach[index]["coach-contact"];

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
