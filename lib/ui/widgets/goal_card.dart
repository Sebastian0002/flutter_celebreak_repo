import 'package:flutter/material.dart';
import 'package:todays_activities/ui/themes/colors.dart';
import 'package:todays_activities/ui/widgets/black_button.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14.29),
      decoration: BoxDecoration(
        color: ColorPalette.firstBlue,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(3, 3),
            color: ColorPalette.shadow,
            spreadRadius: 0
          )
        ]
      ),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("You’re close to your goal!", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                  const SizedBox(height: 7),
                  SizedBox(
                    width: width*0.6,
                    child: const Text("Join more sport activities to collect more points", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12))),
                  const SizedBox(height: 13),
                  Row(
                    children: [
                      BlackButton(
                        onTap: (){},
                        text: "Join now",
                        ),
                      const SizedBox(width: 11),
                      BlackButton(
                        onTap: (){},
                        text: "My points",
                        ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: width*0.15,
                width: width*0.15,
                child: const Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: ColorPalette.secondBlue,
                      strokeWidth: 5,
                      strokeCap: StrokeCap.round,
                      value: 0.6,
                    ),
                    Center(child: Text("27", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),)
                  ],
                ),
              )
            ],
          )
    );
  }
}