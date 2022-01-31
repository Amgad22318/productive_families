import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/screens/home/home_screen.dart';
import 'package:productive_families/presentation/styles/colors.dart';
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
  late int index;

  @override
  void initState() {
    index = 0;
    controller = TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer:NavigationDrawer(),
      appBar: DefaultShopAppbar(

        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/bell.svg',
              )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/shopping-cart-outline-badged.svg',
              )),
        ],
        leading: IconButton(
            onPressed: () {_scaffoldKey.currentState!.openDrawer();},
            icon: const Icon(
              Icons.menu,
            )),
      ),
      body: Column(
        children: [
          Image.asset('assets/image/appbar_half_circle.png',),
          Expanded(
            child: TabBarView(
              children: [
                HomeScreen(),
                HomeScreen(),
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
              this.index = index;
            });
          },
          tabs: [
            Tab(
                icon: SvgPicture.asset(
              'assets/icons/home-solid.svg',
              color: index == 0 ? defaultYellow : Colors.grey,
            )),
            Tab(
                icon: SvgPicture.asset(
              'assets/icons/shop.svg',
              color: index == 1 ? defaultYellow : Colors.grey,
            )),
            Tab(
                icon: SvgPicture.asset(
              'assets/icons/heart.svg',
              color: index == 2 ? defaultYellow : Colors.grey,
            )),
            Tab(
                icon: SvgPicture.asset(
              'assets/icons/account.svg',
              color: index == 3 ? defaultYellow : Colors.grey,
            ))
          ],
        ),
      ),
    );
  }
}
