import 'package:flutter/material.dart';
import 'package:todays_activities/ui/pages/widgets/desktop/left_content.dart';
import 'package:todays_activities/ui/pages/widgets/desktop/right_content.dart';
import 'package:todays_activities/ui/pages/widgets/info_screens_body.dart';

class DesktopDisplayInfo extends StatelessWidget {
  const DesktopDisplayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              children: [
                const LeftContent(),
                SizedBox(
                  width: screenWidth*0.53,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: InfoScreensBody(isDesktop: true),
                  )
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: RightContent()),
                ),
              ],
            ))
        ],
      ),
    );
  }
}

