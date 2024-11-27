import 'package:flutter/material.dart';
import 'package:todays_activities/ui/themes/colors.dart';
import 'package:todays_activities/ui/widgets/goal_card_desktop.dart';

class RightContent extends StatelessWidget {
  const RightContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: screenWidth*0.26,
      child: const Padding(
        padding:  EdgeInsets.only(right: 30, top:65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GoalCardDesktop(),
            SizedBox(height: 28.81),
            _YellowCard(),
            SizedBox(height: 29),
            _ImageCard(),
            SizedBox(height: 29),

          ],
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 312,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("assets/image_web.png", fit: BoxFit.cover,),
            const Positioned(
              top: 29,
              left: 19,
              right: 0,
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                "Popular events near you!", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500))),
            const Positioned(
              left: 19,
              right: 28,
              bottom: 90,
              child: Text(
                "Unleash the fun! Explore the world of exciting events happening near you.", style: TextStyle(color: Colors.white))),
            
            Positioned(
              top: 249,
              bottom: 24,
              left: 52,
              right: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: MaterialButton(
                  color: Colors.white,
                  onPressed: (){},
                  child: const Text(
                    "See more", 
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16),),
                  ),
              )),
            Positioned(
              top: 249,
              bottom: 21,
              left: 15,
              right: 223,
              child: Image.asset("assets/profile_photo_3.png", fit: BoxFit.contain)),
            Positioned(
              top: 249,
              bottom: 21,
              left: 27,
              right: 212,
              child: Image.asset("assets/profile_photo_2.png", fit: BoxFit.contain)),
            Positioned(
              top: 249,
              bottom: 21,
              left: 38,
              right: 200,
              child: Image.asset("assets/profile_photo_1.png", fit: BoxFit.contain)),
          ],
        ))
    );
  }
}

class _YellowCard extends StatelessWidget {
  const _YellowCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 21),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorPalette.secondYellow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 64),
          const Text("Weekly workshops\nfor kids", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20) ,),
          const SizedBox(height: 10),
          const Text("Sign up for early access to weekly activities for your kids full of learning and fun!", style: TextStyle(fontSize: 12)),
          const SizedBox(height: 10),
          InkWell(
            onTap: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(3, 3),
                    color: ColorPalette.shadow
                  )
                ]
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Learn more"),
                  Icon(Icons.arrow_circle_right_outlined)
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
