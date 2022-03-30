import 'package:flutter/material.dart';

class TmCnScreen extends StatelessWidget {
  TmCnScreen({Key? key}) : super(key: key);

  var text = '''
TERMS AND CONDITIONS

Sports Gear BD offers all information,tools and services which are used or
concerns Sports Gear BD's carrying out of business and are publicly 
available application in google.The user will be deemed to have accepted all the
terms ,conditions,policies and notices officially stated,as they continue 
to use the website and its services and following terms and conditions:

1.By agreeing to these Terms of Services, you represent that you are at the
age of majority in your present state or province of residence,or that you
have given us your consent to allow any of your minor dependents to use this
application where you are the age of majority in your state or provinence 
of residence.

2.We reserve the right to refuse service to anyone for any reason at any time.
You understand that your content (not including credit card information),
may be transferred unencrypted and may involve the following:
 transmissions over various networks and changes to conform and adapt
to technical requirements of connecting networks or devices.

1. You agree not to reproduce ,duplicate ,copy,sell,resell or exploit any 
portion of the service ,use of the service or access to the service on the website 
through which the servivce is provided, without express wrote permission by us.
2.Availability and pricing of all items are subject to availability.Sports Gear BD
will inform you as soon as possible if the product and services you have orderes 
are not available.If not , then the customer care will offer similar alternatives.
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('FAQ'),),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset('assets/cover.jpg'),
                SizedBox(height: 10,),
                Container(
                  height: .5,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                SizedBox(height: 15,),
                Container(
                    child : Text(text, maxLines: 50, style: TextStyle(fontSize: 16.0 ,color: Colors.black54) ,
                    )
                ),
              ],
            ),
          )
      ),
    );
  }
}
