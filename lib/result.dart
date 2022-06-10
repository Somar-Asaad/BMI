import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.isMale,
    required this.age,
    required this.result,
  }) : super(key: key);

  final bool isMale;
  final int age;
  final double result;

  String get healthPhrase {
    String health;
    if (result >= 30) {
      health = 'obessed';
    } else if (result < 30 && result > 24.9) {
      health = 'over weighted';
    } else if (result < 24.9 && result > 18.5) {
      health = 'normal';
    } else {
      health = 'thin';
    }
    return health;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Gender :${isMale? "Male" : "Female"}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              "Age : ${age.toString()}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              "Result : ${result.round().toString()}",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              "Healthiness : $healthPhrase",
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
