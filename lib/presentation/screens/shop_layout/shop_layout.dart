import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/screens/home/home_screen.dart';
import 'package:productive_families/presentation/screens/markets/markets.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/styles/custom_icons.dart';
import 'package:productive_families/presentation/views/navigation_drawer.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';

class ShopLayout extends StatefulWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  State<ShopLayout> createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout>
    with SingleTickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this)..addListener(() { });

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
                HomeScreen(),
                HomeScreen(),
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
          tabs: [
            Tab(
                icon:Icon(CustomIcons.home_solid,)),
            Tab(
                icon:Icon(CustomIcons.shop)),
            Tab(
                icon:Icon(CustomIcons.heart)),
            Tab(
                icon:Icon(CustomIcons.account)),

          ],
        ),
      ),
    );
  }
}
