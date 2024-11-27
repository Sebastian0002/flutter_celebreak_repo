import 'dart:ui';
import 'package:todays_activities/domain/models/activity.dart';
import 'package:todays_activities/ui/themes/colors.dart';

(Color, Color, String) getInfoTag (Typetag tag){
  
  late Color colorTag;
  late Color colorTagText;
  late String title;

  switch (tag) {
    case Typetag.childcare:
        colorTag = ColorPalette.tagChildcare;
        colorTagText = ColorPalette.tagChildcareText;
        title = "childcare";
      break;
    case Typetag.light:
        colorTag = ColorPalette.taglight;
        colorTagText = ColorPalette.taglightText;
        title = "light";
      break;
    case Typetag.medium:
        colorTag = ColorPalette.tagmedium;
        colorTagText = ColorPalette.tagmediumText;
        title = "medium";
      break;
    case Typetag.high:
        colorTag = ColorPalette.taghigh;
        colorTagText = ColorPalette.taghighText;
        title = "high";
      break;
    default:
      colorTag = ColorPalette.greyText;
      colorTagText = ColorPalette.greyCard;
      title = "none";
  }

  return (colorTag, colorTagText, title);
}

