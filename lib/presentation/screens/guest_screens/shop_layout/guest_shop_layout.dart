import 'package:flutter/material.dart';
import 'package:productive_families/presentation/screens/guest_screens/home/guest_home_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/markets/guest_markets.dart';
import 'package:productive_families/presentation/screens/guest_screens/you_need_to_login_screen/you_need_to_login_screen.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/styles/custom_icons.dart';
import 'package:productive_families/presentation/views/screen_views/guest_screen_views/shared/guest_you_need_to_login_dialog.dart';

class GuestShopLayout extends StatefulWidget {
  final int index;


  const GuestShopLayout({Key? key, this.index = 0}) : super(key: key);

  @override
  State<GuestShopLayout> createState() => _GuestShopLayoutState();
}

class _GuestShopLayoutState extends State<GuestShopLayout>
    with SingleTickerProviderStateMixin {
  late final TabController controller;
  int? lastIndex;



  @override
  void initState() {
    controller = TabController(length: 4, vsync: this)..addListener(() {});
    controller.index = widget.index;
    lastIndex=controller.index;



    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                GuestHomeScreen(),
                GuestMarkets(),
                YouNeedToLoginScreen(title: 'المفضلة',),
                YouNeedToLoginScreen(title: 'زائر',),
              ],
              controller: controller,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: darkBlue,
        child: TabBar(
          onTap: (index) {
            if(index==2||index==3){
              setState(() {
               controller.previousIndex==1?controller.index=1:controller.index=0;
                showDialog(context: context, builder: (context) => GuestYouNeedToLoginDialog());
              });
            }

          },
          isScrollable: false,
          controller: controller,
          tabs: const [
            Tab(icon: Icon(CustomIcons.home, size: 18)),
            Tab(icon: Icon(CustomIcons.shop, size: 18)),
            Tab(
              icon: Icon(
                CustomIcons.heart,
                size: 18,
              ),
            ),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
