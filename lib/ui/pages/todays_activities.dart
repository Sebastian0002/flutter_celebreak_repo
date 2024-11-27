import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todays_activities/constants/constants.dart';
import 'package:todays_activities/domain/models/filter.dart';
import 'package:todays_activities/provider/activity_provider.dart';
import 'package:todays_activities/provider/filter_provider.dart';
import 'package:todays_activities/ui/pages/widgets/desktop/desktop_display_info.dart';
import 'package:todays_activities/ui/pages/widgets/mobile_display_info.dart';

class TodaysActivitiesPage extends StatefulWidget {
  const TodaysActivitiesPage({super.key});

  @override
  State<TodaysActivitiesPage> createState() => _TodaysActivitiesPageState();
}

class _TodaysActivitiesPageState extends State<TodaysActivitiesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      //initialize the filter
      context.read<FilterProvider>().setFilterList(TypeFilter.all);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    context.watch<ActivityProvider>();
    return  LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          //here we evaluate if the size screen is for mobile or tablet (Desktop)
          return  constraints.maxWidth <= mobilemaxWidth
          ? const MobileDisplayInfo()
          : const DesktopDisplayInfo();
        },
    );
  }
}