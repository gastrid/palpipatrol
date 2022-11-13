import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/food.dart';



class Foods with ChangeNotifier {
  final db = FirebaseFirestore.instance;
  List<Food> _foods = [];

  List<Food> get foods {
    return [..._foods];
  }


  Future<void> getFoods() async {
    print('here');
    _foods = [];
    await db.collection('foods').get().then(
      (res) => res.docs.forEach((element) {
        var body = element.data();
        // int score = int.parse(body["score"]);
        _foods.add(Food(
          id: element.id,
          colour: body["colour"],
          name: body["name"],
          score: body["score"],
        ));

        }),
      onError: (e) => print("Error completing: $e"),
    );
    notifyListeners();
  }

}