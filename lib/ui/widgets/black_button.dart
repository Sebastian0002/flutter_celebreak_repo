
import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  const BlackButton({
    super.key,
    required this.onTap,
    this.marginHeight,
    this.marginWidth,
    this.padingHeight,
    this.padingWidth,
    this.text,
    this.textSize,
    });

  final Function()? onTap;
  final double? marginHeight;
  final double? marginWidth;
  final double? padingHeight;
  final double? padingWidth;
  final double? textSize;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: marginWidth ?? 0, vertical: marginHeight ?? 0),
        padding: EdgeInsets.symmetric(horizontal: padingWidth ?? 8, vertical: padingHeight ?? 4),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Text(
          text ?? "Black button", 
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.w500, 
            fontSize: textSize), 
          textAlign: TextAlign.center),
      ),
    );  
  }
}
