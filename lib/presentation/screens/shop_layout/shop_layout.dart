import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

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
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xFFFFDC2A),
                Color(0xFFFFF2B3),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/shopping-cart-outline-badged.png',
            ),
          ),
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/icons/bell.png')),
        ],
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
            )),
        backgroundColor: defaultYellow,
      ),
      body: Column(
        children: const [
          Center(
              child: Image(
                  image: AssetImage('assets/image/appbar_half_circle.png')))
        ],
      ),
      bottomNavigationBar: Material(
        color: darkBlue,
        child: TabBar(
          controller: controller,
          onTap: (index) {
            setState(() {});
          },
          tabs: const [
            Tab(icon: Icon(Icons.menu_rounded,)),
            Tab(icon: Icon(Icons.piano)),
            Tab(icon: Icon(Icons.car_rental_rounded)),
            Tab(icon: Icon(Icons.settings_rounded))
          ],
        ),
      ),
    );
  }
}
