import 'dart:io';

import 'package:flutter/material.dart';
import 'package:palpipatrol/providers/foods.dart';
import 'package:provider/provider.dart';

class GreenList extends StatefulWidget {
  const GreenList({Key? key}) : super(key: key);

  @override
  _GreenListState createState() => _GreenListState();
}

class _GreenListState extends State<GreenList> {

  @override
  Widget build(BuildContext context) {
    // TODO: could potentially delete this as we've got Consumer
    return Container(
      height: 200,
      child: Column(children: [
        Text(
          "Green foods",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        Expanded(child: Consumer<Foods>(builder: (ctx, foodData, child) {
          return Wrap(
            children: List.generate(
                foodData.green_foods.length,
                (index) =>
                    Chip(
                      label: Text(foodData.green_foods[index].name),
                      backgroundColor: Colors.green,
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
//                               content: Text("Turn '${foodData.green_foods[i].name}' green?"),
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
//                         child: Text(foodData.green_foods[i].name),
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