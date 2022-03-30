import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  DeveloperScreen({Key? key}) : super(key: key);

  var text = '''
Why Sports Gear BD?

*Most of the people fear to online shopping for quality based porduct.
*Many people think the product is not good or the price is comparatively high online.
*Real time online comparison.
*Monitoring different real data feeds across all the market places prices.
*simplifuying the matter of hiring players ,coach and fields.
    
WHY SHOP ON SPORTS GEAR BD?
    
*Most importantly & convenient shopping exprience
*Besides that best customer service exprience
*Best & authentic products in Bangladesh.
*Able to hire coach or players for tournaments .
    
HOW TO GET PRODUCTS UPDATE?
    
*We will offer free update for all of our products.You will recive update 
notice in the notification section of the profile page.Also we will inform updates
through email and our social channels.
    
CAN I EXCCHANGE MY UNSUITABLE PRODUCT?
* YES, the request should be raised up within 24 hours . 

After that we will confirm you about exchange offer.
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset('assets/incomplete.JPG'),
            ],
          ),
        )
      ),
    );
  }
}
