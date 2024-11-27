
import 'package:flutter/material.dart';
import 'package:todays_activities/domain/models/activity.dart';
import 'package:todays_activities/domain/models/filter.dart';

class FilterProvider extends ChangeNotifier{

  final List<Activity> _filteredList = [];
  List<Activity> get filteredList => _filteredList;

  void setFilterList(TypeFilter type){  
    _filteredList.clear();
    if(type == TypeFilter.all){
      _filteredList.addAll(activities);
      //Do this when need all the activities just for the current day
      // _filteredList.addAll(activities.where((e) => e.isTodayActivity));
    }
    _filteredList.addAll(activities.where((e)=> e.typeFilter == type));
    //Do this when need all the activities just for the current day
    // _filteredList.addAll(activities.where((e)=> e.typeFilter == type && e.isTodayActivity));
    notifyListeners();
  }

}
