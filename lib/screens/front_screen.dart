import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palpipatrol/providers/foods.dart';
import 'package:palpipatrol/screens/front_screen_widgets/orange_checker.dart';
import 'package:palpipatrol/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:palpipatrol/providers/auth.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:textfield_tags/textfield_tags.dart';

import 'front_screen_widgets/meal_builder.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Foods>(context).getFoods().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

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
        title: Text('PalpiPatrol'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Text("wait...")// TODO : shows only this
          : SingleChildScrollView(
              child: Container(
                height: deviceSize.height,
                width: deviceSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    MealBuilder(),
                    OrangeChecker(),
                  ],
                ),
              ),
            ),
    );
  }
}
