import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todays_activities/provider/filter_provider.dart';
import 'package:todays_activities/ui/pages/widgets/helpers/get_actual_name_day.dart';
import 'package:todays_activities/ui/themes/colors.dart';
import 'package:todays_activities/ui/widgets/activity_card/activity_card.dart';
import 'package:todays_activities/ui/widgets/custom_dottedline.dart';
import 'package:todays_activities/ui/widgets/custom_search_field.dart';
import 'package:todays_activities/ui/widgets/filter_list_view.dart';
import 'package:todays_activities/ui/widgets/goal_card.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InfoScreensBody extends StatelessWidget {
  const InfoScreensBody({
    super.key,
    required this.isDesktop
  });

  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    //be sure that always have the list of activities filtered
    final todayActivities = context.watch<FilterProvider>().filteredList;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(isDesktop)
              Text(getActualDate(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: ColorPalette.greyText)),
              const Text('This week in Estepona', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              const SizedBox(height: 19.29),
              if(!isDesktop)
              const Column(
                children: [
                  GoalCard(),
                  SizedBox(height: 17.4),
                ],
              ),
              CustomSearchField(
                onChanged: (str) {
                  
                },
              ),
              const SizedBox(height: 18.13),
              const FilterListView(),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: DottedLinePainter(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                        child: RichText(
                          text: TextSpan(
                            text: "Today ", 
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                            children: [
                              TextSpan(
                                text: "/ ${getActualNameDay().toLowerCase()}",
                                style: const TextStyle(color: ColorPalette.greyText)
                              )
                            ]
                            ),
                          )
                    ),
                    todayActivities.isEmpty
                    ?Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: ColorPalette.firstPurple,
                                  radius: 130,
                                  child: Image.asset("assets/empty.png", fit: BoxFit.contain,)),
                                const SizedBox(height: 10),
                                const Text("Ups! Looks like there's no activities for today yet", textAlign: TextAlign.center, style: TextStyle(color: ColorPalette.greyText),)
                              ]
                              .animate()
                              .fadeIn()
                              .scale()
                            )
                          ),
                        ),
                      ),
                    )
                    :Expanded(
                      child: ListView.builder(
                        itemCount: todayActivities.length,
                        itemBuilder: (BuildContext context, int index) {
                          final activity = todayActivities[index];
                          return index == 0
                              ? Padding(padding: const EdgeInsets.only(top: 10), 
                                child: ActivityCard(activity: activity)
                                  .animate()
                                  .fadeIn(duration: 300.ms)
                                )
                              : ActivityCard(activity: activity)
                                  .animate()
                                  .fadeIn(duration: 300.ms);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}