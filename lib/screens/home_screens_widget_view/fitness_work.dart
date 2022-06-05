import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/Exercises.dart';
import 'package:http/http.dart' as http;

import 'fitnes_view.dart';


class FitnessWork extends StatefulWidget {
  const FitnessWork({Key? key}) : super(key: key);


  @override
  State<FitnessWork> createState() => _FitnessWorkState();

}

class _FitnessWorkState extends State<FitnessWork> {


  List<Exercises> allData = [];
  String link = 'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json';
  bool isLoading = false;

  fetchData() async {
    try{

      isLoading = true;

      var response =await http.get(Uri.parse(link));
      print(response.statusCode);
      print(response.body);

      if(response.statusCode == 200){
        final items = jsonDecode(response.body);

        for(var data in items['exercises']){
          Exercises model = Exercises(
            id: data['id'],
            title: data['title'],
            thumbnail: data['thumbnail'],
            gif: data['gif'],
            seconds: data['seconds']
          );

          setState(() {
            allData.add(model);
          });

        }

        print(' Total Length is ${allData.length}');
      }

    }catch(e){
      print(e);
    }finally{
      isLoading = false;
    }
  }


  @override
  void initState() {

    fetchData();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: allData.length,
              itemBuilder: (context, index){
                return InkWell(

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> FitnessView( model: allData[index],)));
                  },

                  child: Container(
                      margin: EdgeInsets.all(20),
                      height: 170,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Image.network('${allData[index].thumbnail}', fit: BoxFit.cover, width: double.infinity,),

                            Positioned(
                              bottom: 0,
                                left: 0, right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.centerLeft,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black26, Colors.black38, Colors.black45, Colors.black54, Colors.black87,
                                      ]
                                    ),
                                  ),

                                  child: Text('${allData[index].title}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 23),),

                                )
                            )
                          ],
                        ),
                      ),
                  ),
                );
              }
          ),
        )
      ),
    );
  }
}
