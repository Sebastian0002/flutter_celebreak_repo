import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todays_activities/domain/models/activity.dart';

class ActivityProvider extends ChangeNotifier{

  //this list will help us to get the activities which we are already joined
  final List<Activity> _myActivities = [];
  List<Activity> get myActivities => _myActivities;

  bool _loading = false;
  bool get loading => _loading;
 
  //This variable will help us to identify if an error ocurred during the transaction when join an activity 
  bool _error = true;
  bool get error => _error;

  Future addActivity( Activity activity ) async {
    //we have control in the UI when user has already joined to an activity but for be sure we ask if this activity is on the list and if it is 
    //just return 
    if(_myActivities.contains(activity)){
      return;
    } 
    _error = false;
    _loading = true;
    notifyListeners();
    //this delayed is used to simulate a fetch API
    await Future.delayed(const Duration(seconds: 2));
    //create a random to get a dynamic responses of success and error to visualize each scenery
    final rand =  Random().nextInt(4);
    if(rand <= 1){
      _myActivities.add(activity);
    }
    else{
      _error = true;
    }
    _loading = false;
    notifyListeners();
  }

}