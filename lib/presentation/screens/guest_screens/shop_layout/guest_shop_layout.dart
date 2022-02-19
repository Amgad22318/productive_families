import 'package:flutter/material.dart';
import 'package:productive_families/presentation/screens/guest_screens/favorite/guest_favorite_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/home/guest_home_screen.dart';
import 'package:productive_families/presentation/screens/guest_screens/markets/guest_markets.dart';
import 'package:productive_families/presentation/screens/user_screens/favorite/favorite_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/home/home_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/markets/markets.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/styles/custom_icons.dart';

class GuestShopLayout extends StatefulWidget {
  final int index;

  const GuestShopLayout({Key? key, this.index = 0}) : super(key: key);

  @override
  State<GuestShopLayout> createState() => _GuestShopLayoutState();
}

class _GuestShopLayoutState extends State<GuestShopLayout>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this)..addListener(() {});
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
                GuestHomeScreen(),
                GuestFavoriteScreen(),
                GuestMarkets(),
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
            Tab(
                icon: Icon(
              CustomIcons.heart,
              size: 18,
            )),
          ],
        ),
      ),
    );
  }
}
