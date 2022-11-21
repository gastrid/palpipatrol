import 'dart:io';

import 'package:flutter/material.dart';
import 'package:palpipatrol/providers/foods.dart';
import 'package:provider/provider.dart';

class RedList extends StatefulWidget {
  const RedList({Key? key}) : super(key: key);

  @override
  _RedListState createState() => _RedListState();
}

class _RedListState extends State<RedList> {

  @override
  Widget build(BuildContext context) {
    // TODO: could potentially delete this as we've got Consumer
    return Container(
      height: 200,
      child: Column(children: [
        Text(
          "Red foods",
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        Expanded(child: Consumer<Foods>(builder: (ctx, foodData, child) {
          return Wrap(
            children: List.generate(
                foodData.red_foods.length,
                (index) =>
                    Chip(
                      label: Text(foodData.red_foods[index].name),
                      backgroundColor: Colors.red,
                      )),
          );
        }))
      ]),
    );
  }
}

// GestureDetector(
//                       onDoubleTap: () {
//                           showDialog(context: context, builder: (ctx) => 
//                             AlertDialog(
//                               title: Text("Confirm action"),
//                               content: Text("Turn '${foodData.red_foods[i].name}' red?"),
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
//                         child: Text(foodData.red_foods[i].name),
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