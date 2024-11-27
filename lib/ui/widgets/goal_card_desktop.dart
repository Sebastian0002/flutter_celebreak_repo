import 'package:flutter/material.dart';
import 'package:todays_activities/ui/themes/colors.dart';
import 'package:todays_activities/ui/widgets/black_button.dart';

class GoalCardDesktop extends StatelessWidget {
  const GoalCardDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14.29),
      decoration: BoxDecoration(
        color: ColorPalette.firstBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("You’re close to your goal!", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: constraints.maxWidth*0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Join more sport activities to collect more points", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
                        const SizedBox(height: 13),
                        Wrap(
                          runSpacing: 5,
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
                  ),
                  SizedBox(
                    height: constraints.maxWidth*0.25,
                    width: constraints.maxWidth*0.25,
                    child: const Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: ColorPalette.thirdBlue,
                          strokeWidth: 8,
                          value: 0.6,
                        ),
                        Center(child: Text("27", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),)
                      ],
                    ),
                  )
                ],
              ),
            ],
          ) ;
        },
      ),
      
    );
  }
}