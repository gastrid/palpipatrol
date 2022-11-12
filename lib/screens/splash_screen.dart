
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 75, 123),
      body: Center(child: Image.asset("assets/palpipatrol-splash.png")),
    );
  }
}