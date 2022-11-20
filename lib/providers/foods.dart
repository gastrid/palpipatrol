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

  List<Food> get orange_foods {
    return _foods.where((element) => element.colour == "orange").toList();
  }

  // void initState() {
  //   collection = 
  // }

  Future<void> getFoods() async {
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
            print(body);
          }),
          onError: (e) => print("Error completing: $e"),
        ).then((value) {
          print("RERENDER");
          notifyListeners();
        });
  }

  Future<void> updateFoods(List<String> tags) async {
    final collection = db.collection("foods").withConverter(
        fromFirestore: Food.fromFirestore,
        toFirestore: (Food food, options) => food.toFirestore());
    tags.forEach((tag) {
      int existing_food_index = _foods.indexWhere((food) => food.name == tag);
      if (existing_food_index != -1) {
        var food = _foods[existing_food_index];
        if (food.colour == "orange") {
          if (food.score == 2) {
            _foods[existing_food_index] = Food(
              id: food.id,
              colour: "red",
              score: 0,
              name: food.name,
            );
          } else {
            _foods[existing_food_index] = Food(
              id: food.id,
              colour: "orange",
              score: food.score + 1,
              name: food.name,
            );
          }
        }
      } else {
        _foods.add(Food(colour: "orange", score: 0, name: tag));
      }
    });
    // final food_coll = db.collection("foods").withConverter(
    //     fromFirestore: Food.fromFirestore,
    //     toFirestore: (Food food, options) => food.toFirestore());

    _foods.forEach((food) async {
      if (food.id == null) {
        await collection.add(food);
      } else {
        await collection.doc(food.id).update(food.toFirestore());
      }
    });

    notifyListeners();
  }

  Future<void> turn_food_green(int index) async {
    final doc = db.collection('foods').doc(_foods[index].id);
    doc.update({"colour": "green", "score": 0}).then((value) {
      _foods[index] = Food(
        id: _foods[index].id,
        name: _foods[index].name,
        colour: "green",
        score: 0);
        notifyListeners();
    }, onError: (e) => {
      print(e)
    });

    return;
  }
}
