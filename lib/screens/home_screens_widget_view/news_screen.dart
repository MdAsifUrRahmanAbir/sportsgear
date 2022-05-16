import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late var _firestoreInstance = FirebaseFirestore.instance;
  late List _news = [];

  fetchPlayers() async {
    QuerySnapshot qn = await _firestoreInstance.collection("news").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _news.add({
          "news-name": qn.docs[i]["news-name"],
          "news-post": qn.docs[i]["news-post"],
          "news-image": qn.docs[i]["news-image"]
        });

        print(qn.docs[i]["news-name"]);
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
            itemCount: _news.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.width+50,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(_news[index]["news-image"], fit: BoxFit.contain,)
                        ),
                        Text(
                          _news[index]["news-name"],
                          style: TextStyle(fontSize: 18.0 ,color: Colors.black87),
                        ),
                        SizedBox(height: 5,),
                        Container(
                          height: .5,
                          width: double.infinity,
                          color: Colors.blue,
                        ),
                        SizedBox(height: 15,),
                        Container(
                            child : Text(_news[index]["news-post"], maxLines: 100, style: TextStyle(fontSize: 16.0 ,color: Colors.black54) ,
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
