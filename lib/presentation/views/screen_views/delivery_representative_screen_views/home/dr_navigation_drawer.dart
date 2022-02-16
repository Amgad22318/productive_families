import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/shared/home/default_drawer_list_tile.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeNavigationDrawer extends StatelessWidget {
  const DeliveryRepresentativeNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkBlue,
      child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsetsDirectional.all(4),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/image/user_photo.png'),
                ),
                Column(
                  children: [
                    DefaultText(
                      color: Colors.white,
                      text: 'الاسم',
                      textStyle: Theme.of(context).textTheme.bodyText2,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/map-location.svg',
                          width: 18,
                          height: 18,
                        ),
                        DefaultText(
                          color: Colors.white,
                          text: 'العنوان',
                          textStyle: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
            text: 'عروض التوصيل',
            icon: 'assets/icons/offer.svg',
            onTap: () {
              Navigator.pushNamed(context, TERMS_AND_CONDITIONS);
            },
          ),
          DefaultDrawerListTile(
            text: 'معلومات عنا',
            icon: 'assets/icons/info.svg',
            onTap: () {
              Navigator.pushNamed(context, ABOUT_US);
            },
          ),
          DefaultDrawerListTile(
            text: 'تسجيل الخروج',
            icon: 'assets/icons/logout.svg',
            onTap: () {
              Navigator.pushNamed(context, TERMS_AND_CONDITIONS);
            },
          ),
        ],
      ),
    );
  }
}
