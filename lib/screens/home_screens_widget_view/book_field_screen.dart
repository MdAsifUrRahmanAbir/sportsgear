import 'package:flutter/material.dart';

class FieldScreen extends StatelessWidget {
  const FieldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Image.asset('assets/cricket.jpg', fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
          Positioned(
            left: 20,
              bottom: 30,
              child: Container(
                color: Colors.black26,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('Book Cricket Stadium!', style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30
                    ),),

                    Text('Available for Booking', style: TextStyle(
                      color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 20
                    ),),

                    SizedBox(height: 10,),
                    Row(
                      children: [

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 13),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 1,),
                          ),
                          child: Text('Book Now', style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25
                          ),),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 1,),
                          ),
                          child: Text('View Details', style: TextStyle(
                              color: Colors.black87, fontSize: 20
                          ),),
                        )

                      ],
                    ),


                  ],
                ),
              )
          ),

        ],
      ),
    );
  }
}
