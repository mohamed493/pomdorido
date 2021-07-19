import 'package:flutter/material.dart';
import 'package:myapp/preferences/day_preference.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Day_preference_widget extends StatefulWidget {
  const Day_preference_widget({Key? key}) : super(key: key);

  @override
  _Day_preference_widgetState createState() => _Day_preference_widgetState();
}

class _Day_preference_widgetState extends State<Day_preference_widget> {
  int _counter = 9;
  SharedPreferences? preferences;

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete((){
      setState(() {});
    });
  }

  void _incrementCounter() async{
    setState(() {
      _counter++;
     preferences?.setInt("counter", _counter);
    });
  }

  Future<void> initializePreference() async{
   preferences = await SharedPreferences.getInstance();
 //   this.preferences?.setString("name", "Peter");
  //  this.preferences?.setStringList("infoList", ["developer","mobile dev"]);
  }

  @override
  Widget build(BuildContext context) {
    return  Text(
      '${preferences?.getInt("counter") ?? 0}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

