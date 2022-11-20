import 'package:flutter/material.dart';
import 'package:palpipatrol/screens/design_screen.dart';
import 'package:palpipatrol/screens/front_screen.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.format_paint),
            title: Text('Design'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(DesignScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Main page'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(FrontScreen.routeName);
            },
          ),
          // Divider(),
          // ListTile(
          //   leading: Icon(Icons.payment),
          //   title: Text('Orders'),
          //   onTap: () {
          //     Navigator.of(context)
          //         .pushReplacementNamed(OrdersScreen.routeName);
          //   },
          // ),
          Divider(),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context, listen: false).signOut();
            },
          ),
        ],
      ),
    );
  }
}
