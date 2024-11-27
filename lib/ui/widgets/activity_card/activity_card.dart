import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todays_activities/domain/models/activity.dart';
import 'package:todays_activities/provider/activity_provider.dart';
import 'package:todays_activities/ui/themes/colors.dart';
import 'package:todays_activities/ui/widgets/widgets.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.activity,
    });
  
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final activityProvider = context.watch<ActivityProvider>();
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          margin: const EdgeInsets.only(bottom: 15, left: 5, right: 6),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                offset: Offset(3, 3),
                color: ColorPalette.shadow,
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: constraints.maxWidth*0.63,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Row(
                      children: [
                        Text(activity.getTimeActivity, style: const TextStyle(fontWeight: FontWeight.w500)),
                        const SizedBox(width: 5),
                        Text("(${activity.duration} min)", style: const TextStyle(color: ColorPalette.greyText, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(activity.title, style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        SvgPicture.asset("assets/map-pin.svg"),
                        const SizedBox(width: 5),
                        Text(activity.location, style: const TextStyle(color: ColorPalette.greyText, fontWeight: FontWeight.w500))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      runSpacing: 5,
                      children: [
                        SpotActivityCard(spotsleft: activity.spotsleft),
                        ...activity.tags.map((element){
                          return TagActivityCard(tag: element);
                        })
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.22,
                child: activityProvider.myActivities.contains(activity)
                ? const Column(
                  children: [
                    Icon(Icons.check_circle_outline_rounded),
                    SizedBox(height: 10),
                    Text("Joined", style: TextStyle(fontWeight: FontWeight.w500),)
                  ],
                )
                
                :Column(
                  children: [
                    Text("${activity.price} €", style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox(height: 15),
                    BlackButton(onTap: ()async{
                      await joinActivityDialog(context, activity: activity);
                    }, padingHeight: 8, padingWidth: 16, text: "Join")
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}