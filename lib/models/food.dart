import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Food {
  String? id;
  String name;
  String colour;
  int score;

  Food({
    this.id,
    required this.name,
    required this.colour,
    required this.score,
  });

  factory Food.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Food(
      id: data?['id'],
      name: data?['name'],
      colour: data?['colour'],
      score: data?['score'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (name != null) "name": name,
      if (colour != null) "colour": colour,
      if (score != null) "score": score,
    };
  }

  @override
  String toString() {
    return """
    name: ${this.name},
    colour: ${this.colour},
    score: ${this.score},
    id: ${this.id},
""";
  }
}
