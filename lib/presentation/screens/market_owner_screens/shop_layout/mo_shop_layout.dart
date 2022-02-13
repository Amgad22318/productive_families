import 'package:flutter/material.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screen/home/dr_home_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screen/profile/dr_profile_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/home/mo_home_screen.dart';
import 'package:productive_families/presentation/screens/market_owner_screens/user_profile/mo_user_profile_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/favorite/favorite_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/home/home_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/markets/markets.dart';
import 'package:productive_families/presentation/screens/user_screens/user_profile/user_profile_screen.dart';

import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/styles/custom_icons.dart';

class MarketOwnerShopLayout extends StatefulWidget {
  final int index;

  const MarketOwnerShopLayout({Key? key, this.index = 0}) : super(key: key);

  @override
  State<MarketOwnerShopLayout> createState() => _MarketOwnerShopLayoutState();
}

class _MarketOwnerShopLayoutState extends State<MarketOwnerShopLayout>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this)..addListener(() {});
    controller.index = widget.index;
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
              children: [
                MarketOwnerHomeScreen(),
                Markets(),
                FavoriteScreen(),
                MarketOwnerUserProfileScreen(),
              ],
              controller: controller,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: darkBlue,
        child: TabBar(
          controller: controller,
          onTap: (index) {
            setState(() {
              controller.index = index;
            });
          },
          tabs: const [
            Tab(icon: Icon(CustomIcons.home, size: 18)),
            Tab(icon: Icon(CustomIcons.shop, size: 18)),
            Tab(icon: Icon(CustomIcons.heart, size: 18)),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
