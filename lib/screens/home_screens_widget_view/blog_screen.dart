import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  BlogScreen({Key? key}) : super(key: key);

  var text = '''
Many seem to have forgotten what quarterback Tua Tagovailoa did while with Alabama in college. I'm fed up with all the slander!

Everyone is trying to get their licks in on Baker Mayfield for the current situation he has put himself in with the Cleveland Browns, but I want to focus on another young QB that is being called out and harassed by the NFL media.

Tua Tagovailoa.

According to the talking heads and the social media bandits, Tua is washed up, inaccurate, and not good enough to be a starter in this league.

After 21 career starts, I would say that is not only rash, but unjustified.

What's the biggest complaint among the haters? Tua is too indecisive, he can't stretch the field with his arm, he makes big mistakes, and he can't read the field.

I am here to say shut up. Give him this season with a new stable of talented wide receivers and then we will see.
I thought Brian Flores was a solid head coach, but using a two offensive coordinator approach hindered Tagovailoa's development and led to underwhelming numbers and no playoff appearance.

Under Doug Pederson - considered by many to be a quarterback whisperer - I feel like Tua will thrive. He formed a great connection with college teammate Jaylen Waddle and proved he could win in crunch time.

Adding Tyreek Hill to the mix and running back Chase Edmonds will only help the QB.

Why is Tua Tagovailoa getting so much hate while not being offered the same amount of time as some other highly-drafted QBs?
Here is how Tua's 13-8 record through 21 starts stacks up:

Joe Burrow: 9-11-1
Justin Herbert: 10-11
Baker Mayfield: 7-13
Kyler Murray: 8-12-1
Since he apparently has horrible accuracy, also, let's take a closer look at his 67.8 percent completion percentage in 2021 compared to these four:

Joe Burrow: 70.4%
Justin Herbert: 65.9%
Baker Mayfield: 60.5%
Kyler Murray: 69.2%
Burrow has that clutchness about his play, Murray can outrun anyone, and Herbert is viewed by many as the next franchise QB for the Chargers.

Yet Tua Tagovailoa is looked at as a failure? Having failed to start half of his first season in the league and most of his second season?

He has two years remaining on his rookie deal. Relax on the hate! Some guys need extra time to adjust to the NFL - for example, Drew Brees.

Brees threw 31 interceptions in his first 27 games! Young guys make mistakes and commit turnovers trying to overcompensate.

It takes a good coach, a good offensive philosophy, and a patient fanbase to reach the heights of a star.

Let Tua work this season and we can more accurately judge him after.
  ''';

  var subTitle = '''
Many seem to have forgotten what quarterback Tua Tagovailoa did while with Alabama in college. I'm fed up with all the slander!
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Blog'),),
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset('assets/blog.jpg',fit: BoxFit.cover, width: double.infinity,),
                Text(
                  'I\'m sick and tired of the Tua slander',
                  style: TextStyle(fontSize: 14.0 ,color: Colors.black26),
                ),
                Text(subTitle, maxLines: 10, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
