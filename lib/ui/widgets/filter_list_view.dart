import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todays_activities/domain/models/filter.dart';
import 'package:todays_activities/provider/filter_provider.dart';
import 'package:todays_activities/ui/themes/colors.dart';
import 'package:todays_activities/ui/widgets/purple_button.dart';

class FilterListView extends StatefulWidget {
  const FilterListView({
    super.key,
  });

  @override
  State<FilterListView> createState() => _FilterListViewState();
}

class _FilterListViewState extends State<FilterListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          PurpleButton(
            onTap: null, 
            child: SvgPicture.asset('assets/sliders.svg'),
            ),
      
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: filterList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final filter = filterList[index];
                  return PurpleButton(
                    color: filter.selected != null ? ColorPalette.secondPurple : null,
                    horizontalMargin: 8,
                    onTap: (){
                      for (var obj in filterList) {
                        obj.setSelected(null);
                      }
                      context.read<FilterProvider>().setFilterList(filter.type);
                      setState(() {
                        filter.setSelected(true);
                      });
                    }, 
                    child: Text(filter.title));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
