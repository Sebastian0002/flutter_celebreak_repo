import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todays_activities/ui/pages/widgets/helpers/get_actual_name_day.dart';
import 'package:todays_activities/ui/pages/widgets/info_screens_body.dart';
import 'package:todays_activities/ui/themes/colors.dart';

class MobileDisplayInfo extends StatelessWidget {
  const MobileDisplayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(getActualDate(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: ColorPalette.greyText))),
        ),
        actions: [
          SvgPicture.asset("assets/bell.svg"),
          const SizedBox(width: 12.05),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: CircleAvatar(
              maxRadius: 14,
              child: Image.asset("assets/profile_image.png"),
            ),
          ),
        ],
      ),
      body: const InfoScreensBody(isDesktop: false),
      bottomNavigationBar: const _CustomBottomNavigationBar(),
    );
  }
}





class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.only(
        bottom: bottomPadding>0 ? 25 : 10, 
        top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(0, 0),
            color: ColorPalette.shadow
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("assets/calendar.svg"),
          SvgPicture.asset("assets/map.svg"),
          CircleAvatar(
            backgroundColor: ColorPalette.firstBlue,
            child: SvgPicture.asset("assets/plus.svg")),
          SvgPicture.asset("assets/users.svg"),
          SvgPicture.asset("assets/star.svg"),
        ],
      ),
    );
  }
}
