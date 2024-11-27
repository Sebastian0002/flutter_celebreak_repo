import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todays_activities/ui/themes/colors.dart';

class LeftContent extends StatelessWidget {
  const LeftContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.black,
      width: size.width*0.21,
      height: size.height,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 58),
                SvgPicture.asset("assets/banner.svg"),
                const SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.only(left: constraints.maxWidth*0.2, right: constraints.maxWidth*0.2, bottom: 30),
                  child: const Column(
                    children: [
                      _RowItems(
                        imageAsset: "assets/calendar.svg",
                        title: "Activities",
                      ),
                      SizedBox(height: 33),
                      _RowItems(
                        imageAsset: "assets/map.svg",
                        title: "Locations",
                      ),
                      SizedBox(height: 33),
                      _RowItems(
                        imageAsset: "assets/star.svg",
                        title: "Services",
                      ),
                      SizedBox(height: 33),
                      _RowItems(
                        imageAsset: "assets/users.svg",
                        title: "Communities",
                      ),
                      SizedBox(height: 33),
                      _RowItems(
                        imageAsset: "assets/bell.svg",
                        title: "Notifications",
                      ),
                      SizedBox(height: 33),
                      _CreateButton(),
                      SizedBox(height: 33),
                      _Profileinfo()
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Profileinfo extends StatelessWidget {
  const _Profileinfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 13,
          child: Image.asset("assets/profile_image.png"),
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: Text(
            "profile", 
            maxLines: 1,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
            )),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: (){},
              child: const Icon(Icons.more_vert, color: Colors.white)),
          )
        )
      ],
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){},
      shape: const StadiumBorder(),
      color: ColorPalette.secondBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/plus.svg", width: 29, height: 29),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  "Create", 
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  overflow: TextOverflow.ellipsis,
                  ))
            ],
          ),
        ),
      ),
      );
  }
}

class _RowItems extends StatelessWidget {
  const _RowItems({  
  required this.imageAsset, 
  required this.title
  });

  final String imageAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          SvgPicture.asset(imageAsset, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              maxLines: 1,
              title, style: const TextStyle(color: Colors.white), overflow: TextOverflow.ellipsis
              ),
          )
        ],
      ),
    );
  }
}

