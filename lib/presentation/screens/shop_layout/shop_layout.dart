import 'package:flutter/material.dart';
import 'package:productive_families/presentation/screens/favorite/favorite_screen.dart';
import 'package:productive_families/presentation/screens/home/home_screen.dart';
import 'package:productive_families/presentation/screens/markets/markets.dart';
import 'package:productive_families/presentation/screens/user_profile/user_profile_screen.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/styles/custom_icons.dart';

class ShopLayout extends StatefulWidget {
  final int index;

  const ShopLayout({Key? key,  this.index=0}) : super(key: key);

  @override
  State<ShopLayout> createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout>
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
                HomeScreen(),
                Markets(),
                FavoriteScreen(),
                UserProfileScreen(),
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
            Tab(icon: Icon(CustomIcons.home_solid, size: 18)),
            Tab(icon: Icon(CustomIcons.shop, size: 18)),
            Tab(
                icon: Icon(
              CustomIcons.heart,
              size: 18,
            )),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
