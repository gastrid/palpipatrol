import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:palpipatrol/providers/auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final auth = Provider.of<Auth>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Google Login"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.center,
          color: Colors.white, child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: auth.signInWithGoogle, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                Image(image: AssetImage("assets/google.png"), height: 35.0),
                Text("Sign in with Google")
              ],))
          ]),
        ));
  }
}
