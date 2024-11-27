import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todays_activities/domain/models/activity.dart';
import 'package:todays_activities/provider/activity_provider.dart';
import 'package:todays_activities/ui/themes/colors.dart';
import 'package:todays_activities/ui/widgets/widgets.dart';

Future<void> joinActivityDialog (
  BuildContext context,
  {required Activity activity}
  ) async{
    final provider = context.read<ActivityProvider>();
    return await showAdaptiveDialog(
      barrierDismissible: true,
      context: context, 
      builder: (context){
        return SimpleDialog(
          backgroundColor: Colors.white,
          contentPadding: const EdgeInsets.all(20),
          title: const Center(child: Text("¡Let's do it!")),
          children: [
            CircleAvatar(
              backgroundColor: ColorPalette.firstBlue,
              radius: 100,
              child: Image.asset("assets/join_activity.png", fit: BoxFit.fill,)),
            const SizedBox(height: 10),
            const Text("You're about to join on this activity, confirm the pay and enjoy!", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500),),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: BlackButton(onTap: () {
                provider.addActivity(activity);
                Navigator.pop(context);
                alertJoined(context);
              }, 
              text: "Confirm"
            ),
            )            
          ],
        );
      });
}

