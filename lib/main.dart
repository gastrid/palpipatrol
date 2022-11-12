import 'package:flutter/material.dart';
import 'package:palpipatrol/providers/auth.dart';

import 'package:palpipatrol/screens/front_screen.dart';
import 'package:provider/provider.dart';
import './screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(colorSchemeSeed: Color.fromRGBO(228, 124, 191, 100),
              fontFamily: 'Lato',
            ),
            home: auth.isSignedIn ? FrontScreen() : AuthScreen()
            ),
      ),
    );
  }
}
