import 'package:flutter/material.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Image.asset('assets/virat.jpg', fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
          Positioned(
            left: 20,
              bottom: 30,
              child: Container(
                color: Colors.black26,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('BUY TICKET', style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30
                    ),),

                    Text('IND vs BD', style: TextStyle(
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
                          child: Text('Buy Now', style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25
                          ),),
                        ),

                        SizedBox(width: 5,),

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 25),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black, width: 1,),
                          ),
                          child: Text('Next', style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25
                          ),),
                        ),


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
