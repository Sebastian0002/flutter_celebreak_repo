
import 'package:flutter/material.dart';
import 'package:todays_activities/domain/models/activity.dart';
import 'package:todays_activities/domain/models/filter.dart';

class FilterProvider extends ChangeNotifier{

  final List<Activity> _filteredList = [];
  List<Activity> get filteredList => _filteredList;

  //This method is encharged to filter the list of activities and also can filter for just today activities just in case of 
  //get differents dates from the API response.

  // the actual method don't filter for today dates because already create list of dates with today dates
  // and other dates this for simulate a most common API response in the real life
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
