import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/drawer_list_tiles.dart';
import 'package:productive_families/presentation/widgets/mo_drawer_list_tiles.dart';

class MarketOwnerNavigationDrawer extends StatelessWidget {
  const MarketOwnerNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkBlue,
      child: ListView(
        children: [
          Row(
            children: [
               Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: defaultYellow),
                      shape: BoxShape.circle
                    ),
                    child:const CircleAvatar(radius: 50,backgroundImage:AssetImage('assets/image/user_photo.png') ,)),
              ),

              Column(
                children: [
                  DefaultText(color: Colors.white,
                    text: 'الاسم',
                    textStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 5.0),
                      child: SvgPicture.asset('assets/icons/location.svg',color: backGroundWhite,width: 18,height: 18,),
                    ),

                    DefaultText(color: Colors.white,
                      text: 'العنوان',
                      textStyle: Theme.of(context).textTheme.bodyText2,
                    ),

                  ],)
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {Navigator.of(context).pop();},
                  icon: SvgPicture.asset('assets/icons/menu_vertical.svg')),

            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(color: defaultYellow,height: 1,),
          ),
          MarketOwnerDrawerListTiles(
            text: 'البنود و الشروط',
            icon: 'assets/icons/notepad-svgrepo.svg',
            onTap: () {
              Navigator.pushNamed(context, MARKET_OWNER_TERMS_AND_CONDITIONS_SCREEN);
            },
          ),
          MarketOwnerDrawerListTiles(
            text: 'إضافة عروض',
            icon: 'assets/icons/offer-svgrepo-com.svg',
            onTap: () {
              Navigator.pushNamed(context, MARKET_OWNER_ADD_OFFER_SCREEN);

            },
          ),
          MarketOwnerDrawerListTiles(
            text: 'معلومات عنا',
            icon: 'assets/icons/info.svg',
            onTap: () {
              Navigator.pushNamed(context, MARKET_OWNER_ABOUT_US_SCREEN);
            },
          ),
          MarketOwnerDrawerListTiles(
            text: 'تسجيل خروج',
            icon: 'assets/icons/logout-svgrepo-com.svg',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, CHOOSE_ACCOUNT_SCREEN, (route) => false);


            },
          ),
        ],
      ),
    );
  }
}
