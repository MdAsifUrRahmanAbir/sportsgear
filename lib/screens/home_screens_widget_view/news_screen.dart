import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
   NewsScreen({Key? key}) : super(key: key);

  var text = '''
Speaking at a pre-match press conference, Mominul said: "South Africa are playing at home and that is always an advantage. However, we have been here for nearly three weeks and the boys have adjusted to conditions."

Mominul and the other Test specialists had a training camp at former South African player and coach Gary Kirsten's academy in Cape Town, while the one-day side were pulling off an historic series win against South Africa.

Bangladesh have lost all six Tests on three previous tours of South Africa and Kingsmead is an unknown factor for the current players, with Bangladesh having only once at the ground, when they lost to Canada in the 2003 Cricket World Cup.

Mominul said he was not sure how the pitch would play.

"There's not too much point in thinking too much about the wicket. It could aid the pacers but still be good for batting. Spinners may come into play as the match progresses."

Unlike on previous tours, Bangladesh will be looking to match South Africa with their fast bowlers.

Ebadot Hossain was the man of the match when they won a Test in New Zealand in January, while Taskin Ahmed was the player of the ODI series against South Africa.

"The pace bowlers have been doing very well in recent times," said Mominul. "They have a lot of confidence coming into this Test series and the whole team has confidence in them."

South African left-arm spinner Keshav Maharaj, who plays his domestic cricket at Kingsmead, said earlier he was not sure how the pitch would play, with more grass on the surface than usual.

"I haven't seen Kingsmead with the colour of the grass like this," he said. "It's a relaid surface." But he said he expected it to be a "traditional" first-class pitch.

With South Africa's first-choice fast bowlers playing in the Indian Premier League, Maharaj is by a distance the most experienced Test bowler in the squad.

But he said he was confident that the replacement pace bowlers would be able to challenge the Bangladesh batsmen.
  ''';

  var subTitle = '''
  Bangladesh's captain Mominul Haque (right) fist bumps with teammate Liton Das during Day 3 of the second Test between New Zealand and Bangladesh in Christchurch on 11 January, 2022. AFP File
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('News'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset('assets/liton.jpg',fit: BoxFit.cover, width: double.infinity,),
              Text(subTitle, maxLines: 10, style: TextStyle(fontSize: 14.0 ,color: Colors.black26)),
              Text(
                  'South Africa vs Bangladesh: Ready for the challenge, says Mominul Haque ahead of first Test',
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Container(
                height: .5,
                width: double.infinity,
                color: Colors.blue,
              ),
              SizedBox(height: 15,),
              Container(
                  child : Text(text, maxLines: 100, style: TextStyle(fontSize: 16.0 ,color: Colors.black54) ,
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}
