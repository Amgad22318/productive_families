import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/shared/home/default_drawer_list_tile.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class GuestNavigationDrawer extends StatelessWidget {
  const GuestNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkBlue,
      child: ListView(
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [

                const Spacer(),
                IconButton(
                    onPressed: () {Navigator.of(context).pop();},
                    icon: SvgPicture.asset('assets/icons/menu_vertical.svg')),

              ],
            ),
          ),
          DefaultDrawerListTile(
            text: 'البنود و الشروط',
            icon: 'assets/icons/notepad.svg',
            onTap: () {
              Navigator.pushNamed(context, TERMS_AND_CONDITIONS);
            },
          ),
          DefaultDrawerListTile(
            text: 'معلومات عنا',
            icon: 'assets/icons/info.svg',
            onTap: () {
              Navigator.pushNamed(context, ABOUT_US_SCREEN);
            },
          ),
          DefaultDrawerListTile(
            text: 'تسجيل خروج',
            icon: 'assets/icons/logout.svg',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, CHOOSE_ACCOUNT_SCREEN, (route) => false);
            },
          ),



        ],
      ),
    );
  }
}
