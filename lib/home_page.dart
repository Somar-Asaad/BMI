import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  int age = 22;
  int weight = 55;
  double height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Body Mass Index"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: buildContainer1(context, "male")),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(child: buildContainer1(context, "female")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15.5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            '$height',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          Text(
                            'CM',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                      Slider(
                        activeColor: Colors.teal,
                        value: height,
                        onChanged: (val) {
                          setState(
                            () {
                              height = double.parse(val.toStringAsFixed(1));
                            },
                          );
                        },
                        min: 150,
                        max: 220,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: buildContainer2(context, "age"),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: buildContainer2(context, "weight"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      double result = weight / (pow(height / 100, 2));
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) {
                            return Result(
                                isMale: isMale, age: age, result: result);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Calcluate",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildContainer1(BuildContext context, String gender) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMale = gender == "male" ? true : false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: ((isMale == true) && (gender == "male")) ||
                  ((isMale == false) && (gender == "female"))
              ? Colors.teal
              : Colors.blueGrey,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            gender == "male"
                ? const Icon(
                    Icons.male,
                    size: 80,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.female,
                    size: 80,
                    color: Colors.white,
                  ),
            const SizedBox(
              height: 15,
            ),
            Text(
              gender == "male" ? "Male" : "Female",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainer2(BuildContext context, String type) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            type == "age" ? "Age" : "Weight",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            type == "age" ? "$age" : "$weight",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    type == "age" ? age-- : weight--;
                  });
                },
                child: const Icon(Icons.remove),
                mini: true,
                heroTag: type == "age" ? "age--" : "weight--",
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    type == "age" ? age++ : weight++;
                  });
                },
                child: const Icon(Icons.add),
                mini: true,
                heroTag: type == "age" ? "age++" : "weight++",
              ),
            ],
          )
        ],
      ),
    );
  }
}
