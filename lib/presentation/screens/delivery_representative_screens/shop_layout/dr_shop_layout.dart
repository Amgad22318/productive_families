import 'package:flutter/material.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/home/dr_home_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/profile/dr_profile_screen.dart';
import 'package:productive_families/presentation/screens/delivery_representative_screens/quotations/dr_quotations.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/styles/custom_icons.dart';

class DeliveryRepresentativeShopLayout extends StatefulWidget {
  final int index;

  const DeliveryRepresentativeShopLayout({Key? key,  this.index=0}) : super(key: key);

  @override
  State<DeliveryRepresentativeShopLayout> createState() => _DeliveryRepresentativeShopLayoutState();
}

class _DeliveryRepresentativeShopLayoutState extends State<DeliveryRepresentativeShopLayout>
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
                DeliveryRepresentativeHomeScreen(),
                DeliveryRepresentativeQuotations(),
                DeliveryRepresentativeProfileScreen(),
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
            Tab(icon: Icon(CustomIcons.hand, size: 18)),
            Tab(icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
