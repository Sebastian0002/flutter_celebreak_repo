import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todays_activities/ui/themes/colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.onChanged
    });

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(3, 3),
            color: ColorPalette.shadow,
          )
        ]
      ),
      child: TextField(
        cursorColor: Colors.black,
        autocorrect: false,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
            color: ColorPalette.greyText,
            fontWeight: FontWeight.w400,
            fontSize: 14
          ),
          hintText: "What do you feel like doing?",
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIconConstraints: const BoxConstraints(maxHeight: 24, maxWidth: 24),
          suffixIcon: SvgPicture.asset("assets/search.svg", fit: BoxFit.contain),
        ),
        onChanged: onChanged,
      )

    );
  }
}