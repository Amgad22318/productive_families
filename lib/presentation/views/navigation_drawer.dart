import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/drawer_list_tiles.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkBlue,
      child: ListView(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(radius: 50,backgroundImage:AssetImage('assets/image/user_photo.png') ,),
              ),
              Column(
                children: [
                  DefaultText(color: Colors.white,
                    text: 'الاسم',
                    textStyle: Theme.of(context).textTheme.bodyText2,
                  ),
                  Row(children: [
                    SvgPicture.asset('assets/icons/map-location.svg',width: 18,height: 18,),

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
          DrawerListTiles(
            text: 'البنود و الشروط',
            icon: 'assets/icons/contract.png',
            onTap: () {
              Navigator.pushNamed(context, TERMS_AND_CONDITIONS);
            },
          ),
          DrawerListTiles(
            text: 'معلومات عنا',
            icon: 'assets/icons/info.png',
            onTap: () {
              Navigator.pushNamed(context, ABOUT_US);

            },
          ),
          DrawerListTiles(
            text: 'طلباتك',
            icon: 'assets/icons/shopping-bag (1).png',
            onTap: () {
              Navigator.pushNamed(context, ORDERES_SCREEN);
            },
          ),
          DrawerListTiles(
            text: 'تسجيل خروج',
            icon: 'assets/icons/log-out.png',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, START_SCREEN, (route) => false);


            },
          ),
        ],
      ),
    );
  }
}
