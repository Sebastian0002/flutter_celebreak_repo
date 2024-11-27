import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todays_activities/provider/activity_provider.dart';
import 'package:todays_activities/provider/filter_provider.dart';
import 'package:todays_activities/ui/pages/todays_activities.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FilterProvider()),
      ChangeNotifierProvider(create: (_) => ActivityProvider()),
    ],
    child: const MainApp()));
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffFBFBFB),
        appBarTheme: const AppBarTheme(
          color: Color(0xffFBFBFB)
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const TodaysActivitiesPage()
      },
    );
  }
}
