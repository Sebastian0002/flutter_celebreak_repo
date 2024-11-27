import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todays_activities/domain/models/activity.dart';
import 'package:todays_activities/ui/themes/colors.dart';
import 'package:todays_activities/ui/widgets/activity_card/helpers/get_tag_info.dart';

class TagActivityCard extends StatelessWidget {
  const TagActivityCard({
    super.key,
    required this.tag
    });
  
  final Typetag tag;

  @override
  Widget build(BuildContext context) {
    final (Color, Color, String) info = getInfoTag(tag); 
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: info.$1
      ),
      child: Text(
        info.$3,
        style: TextStyle(
          color: info.$2,
          fontWeight: FontWeight.w700,
          fontSize: 10
        ),
      ),
    );
  }
}

class SpotActivityCard extends StatelessWidget {
  const SpotActivityCard({
    super.key,
    required this.spotsleft
    });
  
  final int spotsleft;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: ColorPalette.greyCard
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/user.svg"),
          const SizedBox(width: 2),
          Text(
            "$spotsleft spots left",
            style: const TextStyle(
              color: ColorPalette.greyText,
              fontWeight: FontWeight.w700,
              fontSize: 10
            ),
          ),
        ],
      ),
    );
  }
}



