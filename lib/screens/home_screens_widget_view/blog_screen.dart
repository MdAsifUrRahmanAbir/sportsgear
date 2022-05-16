import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  late var _firestoreInstance = FirebaseFirestore.instance;
  late List _blog = [];

  fetchPlayers() async {
    QuerySnapshot qn = await _firestoreInstance.collection("blog").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _blog.add({
          "blog-name": qn.docs[i]["blog-name"],
          "blog-post": qn.docs[i]["blog-post"],
          "blog-image": qn.docs[i]["blog-image"]
        });

        print(qn.docs[i]["blog-name"]);
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
      backgroundColor: Colors.white,
        appBar: AppBar(title: Text('News'),
          centerTitle: true,
          actions: [
            Icon(Icons.arrow_forward_ios),
            SizedBox(width: 15,)
          ],
        ),
      body: PageView.builder(
        itemCount: _blog.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.width+50,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(_blog[index]["blog-image"], fit: BoxFit.contain,)
                      ),
                      Text(
                        _blog[index]["blog-name"],
                        style: TextStyle(fontSize: 18.0 ,color: Colors.black26),
                      ),
                      SizedBox(height: 5,),
                      Container(
                        height: .5,
                        width: double.infinity,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 15,),
                      Container(
                          child : Text(_blog[index]["blog-post"], maxLines: 100, style: TextStyle(fontSize: 16.0 ,color: Colors.black54) ,
                          )
                      ),
                    ],
                  ),
                )
            );
          }
      )
    );
  }
}
