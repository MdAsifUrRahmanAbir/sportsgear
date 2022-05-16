import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';


class PCProfile extends StatefulWidget {
   PCProfile({Key? key, required this.name, required this.img, required this.cat, required this.contact}) : super(key: key);
   String name;
   String cat;
   String contact;
   String img;

  @override
  _PCProfileState createState() => _PCProfileState();
}

class _PCProfileState extends State<PCProfile> {

  final TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

          body: SingleChildScrollView(
            child: Column(
              children: [

                Container(
                    height: MediaQuery.of(context).size.width+20,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(widget.img, fit: BoxFit.contain,)
                ),

                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent.withOpacity(.3),
                    borderRadius: BorderRadius.circular(20),

                  ),

                  child: Column(
                    children: [
                      Text('Name: ${widget.name}'),
                      Text('Name: ${widget.cat}'),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Rattings: 4.8'),
                          Icon(Icons.star),
                        ],
                      ),

                      Spacer(),
                      Text('Email: ${widget.contact}'),
                    ],
                  ),
                ),
                // TextFormField(
                //     maxLines: null,
                //     expands: true,
                // controller: textController,
                // decoration: InputDecoration(
                // border: OutlineInputBorder(),
                //   labelText: 'Enter Text',
                //   )
                // ),


                MaterialButton(
                  onPressed: () async{

                    final Email email = Email(
                      body: 'Hello ${widget.name},\n Write Text...',
                      subject: "${widget.name}, We need to Hire You for Our Team/ Club.",
                      recipients: [widget.contact],
                      isHTML: false,
                    );
                    await FlutterEmailSender.send(email);
                    //showSnackBar('Send Mail Success', context);
                  },
                  height: 20,
                  minWidth: 150,
                  elevation: 2,
                  color: Colors.amberAccent,
                  child: Text('Contact'),
                ),

              ],
            ),
          ),
        )
    );
  }
}
