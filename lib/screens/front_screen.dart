import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palpipatrol/providers/foods.dart';
import 'package:provider/provider.dart';
import 'package:palpipatrol/providers/auth.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:textfield_tags/textfield_tags.dart';

import 'front_screen_widgets/meal_builder.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  final db = FirebaseFirestore.instance;
  var food = "some stuff";

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();

    // Future<void> logout() async {
    //   auth.signOut().then((value) => print("logged out"));
    // }

    // Future<void> onPressed() async {
    //     try {
    //         final ss = db.collection("foods");
    //         print('we got here');
    //         ss.doc("ImNl6URrfFJe5BsNTDzI").get().then((value) => {
    //           setState(() {
    //             food = value.data().toString();
    //           })
    //         }, onError: (e) => print(e));
    //       } catch(error) {
    //         throw error;
    //       }

    // };

    return Scaffold(
      appBar: AppBar(
        title: Text('Boooyaaa'),
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed:() {
            // Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed('/');
              
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context, listen: false).signOut();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              MealBuilder(),
              FutureBuilder(
                  future: Provider.of<Foods>(context, listen: false).getFoods(),
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Consumer<Foods>(
                        builder: (ctx, foodData, child) => ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: foodData.foods.length,
                          itemBuilder: (ctx, i) => Text(foodData.foods[i].name),
                        ),
                      );
                      // return Text("Woopla");
                    } else {
                      print(
                          "snapshot.connectionState == ${snapshot.connectionState}");
                      return Text("Too bad, sucker");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
