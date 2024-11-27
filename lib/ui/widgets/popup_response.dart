import 'package:flutter/material.dart';
import 'package:todays_activities/main.dart';
import 'package:todays_activities/ui/themes/colors.dart';

Future<void> customErrorDialog () async{
  final currentContext = navigatorKey.currentState?.overlay?.context;
    if(currentContext != null){
      showAdaptiveDialog(
        barrierDismissible: true,
        context: currentContext, 
        builder: (context){
          return SimpleDialog(
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.all(20),
            title: const Center(child: Text("Error")),
            children: [
              CircleAvatar(
                backgroundColor: ColorPalette.firstYellow,
                radius: 100,
                child: Image.asset("assets/error_2.png", fit: BoxFit.fill,)),
              const SizedBox(height: 10),
              const Text("Ups!, something went wrong, please try again.", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500),)
            ],
          );
        });
    } 
}

Future<void> customSuccesDialog () async{
  final currentContext = navigatorKey.currentState?.overlay?.context;
    if(currentContext != null){
      showAdaptiveDialog(
        barrierDismissible: true,
        context: currentContext, 
        builder: (context){
          return SimpleDialog(
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.all(20),
            title: const Center(child: Text("Complete")),
            children: [
              CircleAvatar(
                backgroundColor: ColorPalette.tagChildcareText,
                radius: 100,
                child: Image.asset("assets/succes.png", fit: BoxFit.fill,)),
              const SizedBox(height: 10),
              const Text("¡Great!, now you're in, enjoy.", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500),)
            ],
          );
        });
    } 
}



