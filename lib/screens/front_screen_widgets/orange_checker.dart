import 'dart:io';

import 'package:flutter/material.dart';
import 'package:palpipatrol/providers/foods.dart';
import 'package:provider/provider.dart';

class OrangeChecker extends StatefulWidget {
  const OrangeChecker({Key? key}) : super(key: key);

  @override
  _OrangeCheckerState createState() => _OrangeCheckerState();
}

class _OrangeCheckerState extends State<OrangeChecker> {

  void updateFood(int index) {
    final foods_provider = Provider.of<Foods>(context, listen: false);
    foods_provider.turn_food_green(index);
    print("Food updated: ${foods_provider.foods[index].name}");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: could potentially delete this as we've got Consumer
    var orange_foods = Provider.of<Foods>(context).orange_foods;
    return Container(
      height: 200,
      child: Column(children: [
        Text(
          "Orange foods",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        Text("Long click to turn green"),
        Expanded(child: Consumer<Foods>(
              builder: (ctx, foodData, child) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: foodData.orange_foods.length,
                    itemBuilder: (ctx, i) => GestureDetector(
                      onDoubleTap: () {
                          showDialog(context: context, builder: (ctx) => 
                            AlertDialog(
                              title: Text("Confirm action"),
                              content: Text("Turn '${foodData.orange_foods[i].name}' green?"),
                              actions: <Widget>[
                                TextButton(onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: Text("Cancel")),
                                TextButton(onPressed: () {
                                  updateFood(i);
                                  Navigator.of(context).pop();
                                }, child: Text("Ok")),
                              ],
                            )
                          );
                        },
                      child: TextButton(
                        child: Text(foodData.orange_foods[i].name),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                        ),
                        onPressed: (() {
                        }
                        ),
                    ),
                  )),
            ))
        
      ]),
    );
  }
}
