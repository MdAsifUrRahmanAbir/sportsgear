import 'package:flutter/material.dart';
import 'package:sports_gear/model/Exercises.dart';

class FitnessView extends StatelessWidget {
   FitnessView({Key? key, required this.model}) : super(key: key);

   Exercises? model = Exercises();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: SizedBox(
        height: 600,
        width: double.infinity,
        child: Stack(
          children: [
            Image.network('${model?.thumbnail}', fit: BoxFit.cover, width: double.infinity, height: 600, alignment: Alignment.center,)
          ],
        ),
      ),
    ));
  }
}
