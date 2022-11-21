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
    final id = foods_provider.orange_foods[index].id;
    if (id != null) foods_provider.turn_food_green(id);
    print("Food updated: ${foods_provider.orange_foods[index].name}");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: could potentially delete this as we've got Consumer
    var orange_foods = Provider.of<Foods>(context).orange_foods;
    return Container(
      child: Column(children: [
        Text(
          "Orange foods",
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        Text("Press to turn green"),
        Consumer<Foods>(builder: (ctx, foodData, child) {
          return Wrap(
            children: List.generate(
                foodData.orange_foods.length,
                (index) =>
                    Chip(
                      label: Text(foodData.orange_foods[index].name),
                      deleteIcon: Icon(Icons.check),
                      backgroundColor: Colors.orange,
                      deleteIconColor: Colors.grey,
                      onDeleted: (() {
                        showDialog(context: context, builder: (ctx) => 
                            AlertDialog(
                              title: Text("Confirm action"),
                              content: Text("Turn '${foodData.orange_foods[index].name}' green?"),
                              actions: <Widget>[
                                TextButton(onPressed: () {
                                  Navigator.of(context).pop();
                                }, child: Text("Cancel")),
                                TextButton(onPressed: () {
                                  updateFood(index);
                                  Navigator.of(context).pop();
                                }, child: Text("Ok")),
                              ],
                            )
                          );
                      }),
                      )),
          );
        })
      ]),
    );
  }
}

// GestureDetector(
//                       onDoubleTap: () {
//                           showDialog(context: context, builder: (ctx) => 
//                             AlertDialog(
//                               title: Text("Confirm action"),
//                               content: Text("Turn '${foodData.orange_foods[i].name}' green?"),
//                               actions: <Widget>[
//                                 TextButton(onPressed: () {
//                                   Navigator.of(context).pop();
//                                 }, child: Text("Cancel")),
//                                 TextButton(onPressed: () {
//                                   updateFood(i);
//                                   Navigator.of(context).pop();
//                                 }, child: Text("Ok")),
//                               ],
//                             )
//                           );
//                         },
//                       child: TextButton(
//                         child: Text(foodData.orange_foods[i].name),
//                         style: ButtonStyle(
//                           backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
//                           shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         )),
//                         ),
//                         onPressed: (() {
//                         }
//                         ),
//                     ),
//                   )