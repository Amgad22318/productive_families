import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/home/mo_home_first_section_item.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/home/mo_home_section_item.dart';

class MarketOwnerCategorySelectorItem extends StatefulWidget {
  MarketOwnerCategorySelectorItem({Key? key}) : super(key: key);


  @override
  _MarketOwnerCategorySelectorItemState createState() =>
      _MarketOwnerCategorySelectorItemState();
}

class _MarketOwnerCategorySelectorItemState
    extends State<MarketOwnerCategorySelectorItem> {
  bool isPress = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isPress =! isPress ;
        });
      },
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: formFieldBackGroundLightBlue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Container(color: backGroundWhite, height: 1)),
                  const SizedBox(width: 10),
                  SvgPicture.asset('assets/icons/mic.svg'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5,),
          if(isPress)...[
            Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.bottom,
              hoverThickness: 25.0,
              thickness: 3.0,
              showTrackOnHover: true,
              isAlwaysShown: true,
              child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MarketOwnerHomeFirstSectionItem(),
                  Row(
                    children: List.generate(20, (index) {
                      return MarketOwnerHomeSectionItem();
                    }),
                  ),
                ],
              ),
          ),
            ),]
        ],
      ),
    );
  }
}
