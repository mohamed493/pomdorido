import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async';

class Day_preference with ChangeNotifier {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

   Future<int>? _numBomodorosToday;
  // void initState() {
  //   super.initState();
  //   _numBomodorosToday = _prefs.then((SharedPreferences prefs) {
  //     return (prefs.getInt('numBomodorosToday') ?? 0);
  //   });
  // }
    numBomodorosToday(v){
      _numBomodorosToday=v ;
      notifyListeners() ;
  }
  Future<SharedPreferences> get get_prefs {
    return _prefs ;
  }

  Future<void> increase() async {
    final SharedPreferences prefs = await _prefs;
    final int numBomodorosToday = (prefs.getInt('numBomodorosToday') ?? 0) + 1;
    _numBomodorosToday = prefs
        .setInt("numBomodorosToday", numBomodorosToday)
        .then((bool success) {
      return numBomodorosToday;
    });
    notifyListeners();
  }

  Future<int>? get_numBomodorosToday() {
    return _numBomodorosToday;
  }


  }

