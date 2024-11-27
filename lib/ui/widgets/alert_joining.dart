import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todays_activities/provider/activity_provider.dart';
import 'package:todays_activities/ui/widgets/popup_response.dart';


Future<void> alertJoined (BuildContext context) async{
    return await showAdaptiveDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context){    
        final provider = context.watch<ActivityProvider>();
        if (!provider.loading){
          //when end loading close the charging screen and display dialogs according the result
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
            //here we display on the screen if the joining on the activity was successfull
            if(provider.error){
              WidgetsBinding.instance.addPostFrameCallback((_){
                customErrorDialog();
              });
            }
            else{
              WidgetsBinding.instance.addPostFrameCallback((_){
                customSuccesDialog();
              });
            }
          }
        }
        return const AlertDialog.adaptive(
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.all(20),
          title: Text("Wait till the process is complete"),
          content: Padding(
            padding: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      });
}

