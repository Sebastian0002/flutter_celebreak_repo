import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todays_activities/domain/models/filter.dart';
import 'package:uuid/uuid.dart';

class Activity {
  final String id = const Uuid().v4();
  final DateTime dateActivity;
  final int duration;
  final String title;
  final String location;
  final int price;
  final int spotsleft;
  final List<Typetag> tags;
  final TypeFilter typeFilter;

  Activity({
    required this.dateActivity, 
    required this.duration, 
    required this.title, 
    required this.location, 
    required this.price, 
    required this.spotsleft, 
    required this.tags,
    required this.typeFilter,
    });
  
  
  String get getTimeActivity  => DateFormat('HH:mm').format(dateActivity);
  bool get isTodayActivity => DateUtils.isSameDay(DateTime.now(), dateActivity);
}



enum Typetag {
  childcare,
  light, 
  medium,
  high
}
//simulate dates getting from an endpoint
List<DateTime> dates = [
  DateTime.parse("2024-11-16 07:00"),
  DateTime.parse("2024-11-27 07:00"),
  DateTime.parse("2024-11-27 10:00"),
  DateTime.parse("2024-11-27 13:00"),
  DateTime.parse("2024-11-27 17:00"),
  ];

//simulate activities getting from an endpoint
List<Activity> activities = [
  Activity(
  dateActivity: dates[0], 
  duration: 60,
  title: "5-a-side Football", 
  location: "Playa de las Catedrales", 
  price: 20, 
  spotsleft: 3, 
  tags: [
    Typetag.childcare,
    Typetag.high
  ],
  typeFilter: TypeFilter.sports
  ),
  Activity(
    dateActivity: dates[1], 
    duration: 60,
    title: "Beach Yoga", 
    location: "La Playa de la Rada", 
    price: 9, 
    spotsleft: 8, 
    tags: [
      Typetag.light
    ],
    typeFilter: TypeFilter.calm
    ),
  Activity(
    dateActivity: dates[2], 
    duration: 45,
    title: "Reformer Pilates", 
    location: "Wellness Studio", 
    price: 15, 
    spotsleft: 3, 
    tags: [
      Typetag.medium,
      Typetag.childcare
    ],
    typeFilter: TypeFilter.popular
    ),
  Activity(
    dateActivity: dates[3], 
    duration: 60,
    title: "5-a-side Football", 
    location: "Municipal Sports Center", 
    price: 19, 
    spotsleft: 0, 
    tags: [
      Typetag.childcare,
      Typetag.high
    ],
    typeFilter: TypeFilter.sports
    ),
  Activity(
    dateActivity: dates[4], 
    duration: 45,
    title: "Standing Tapas Lunch", 
    location: "Casa Marina", 
    price: 15, 
    spotsleft: 6, 
    tags: [
      Typetag.childcare,
    ],
    typeFilter: TypeFilter.food
    ),
];