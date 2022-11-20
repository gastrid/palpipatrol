import 'package:flutter/material.dart';
import 'package:palpipatrol/widgets/app_drawer.dart';

class DesignScreen extends StatelessWidget {
  const DesignScreen({Key? key}) : super(key: key);

  static const routeName = '/design';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('PalpiPatrol'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: deviceSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).dividerColor,
                    child: Text("dividerColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).backgroundColor,
                    child: Text("backgroundColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).bottomAppBarColor,
                    child: Text("bottomAppBarColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).canvasColor,
                    child: Text("canvasColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).cardColor,
                    child: Text("cardColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).dialogBackgroundColor,
                    child: Text("dialogBackgroundColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).disabledColor,
                    child: Text("disabledColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).dividerColor,
                    child: Text("dividerColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).errorColor,
                    child: Text("errorColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).focusColor,
                    child: Text("focusColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).highlightColor,
                    child: Text("highlightColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).hintColor,
                    child: Text("hintColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).hoverColor,
                    child: Text("hoverColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).indicatorColor,
                    child: Text("indicatorColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).primaryColor,
                    child: Text("primaryColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).primaryColorDark,
                    child: Text("primaryColorDark")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).primaryColorLight,
                    child: Text("primaryColorLight")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Text("scaffoldBackgroundColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Text("secondaryHeaderColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).selectedRowColor,
                    child: Text("selectedRowColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).shadowColor,
                    child: Text("shadowColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).splashColor,
                    child: Text("splashColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).toggleableActiveColor,
                    child: Text("toggleableActiveColor")),
              ),
              Container(
                width: deviceSize.width,
                height: 50,
                child: ColoredBox(
                    color: Theme.of(context).unselectedWidgetColor,
                    child: Text("unselectedWidgetColor")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
