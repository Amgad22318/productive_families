import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_families/business_logic/user/category/user_category_cubit.dart';
import 'package:productive_families/business_logic/user/local/user_local_cubit.dart';
import 'package:productive_families/presentation/screens/user_screens/favorite/favorite_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/home/user_home_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/stores/stores_screen.dart';
import 'package:productive_families/presentation/screens/user_screens/user_profile/user_profile_screen.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/styles/custom_icons.dart';

import '../../../../business_logic/user/stores/user_all_and_single_category_stores_cubit.dart';

class UserShopLayout extends StatefulWidget {
  final int index;

  const UserShopLayout({Key? key, this.index = 0}) : super(key: key);

  @override
  State<UserShopLayout> createState() => _UserShopLayoutState();
}

class _UserShopLayoutState extends State<UserShopLayout>
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserLocalCubit()
            ..getUserProfileData()
            ..getUserTopRatedProducts(),
        ),
        BlocProvider(
          create: (context) => UserCategoryCubit()..getUserAllCategories(),
        ),
        BlocProvider(
          create: (context) => UserAllAndSingleCategoryStoresCubit(),
        ),
      ],
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  UserHomeScreen(),
                  StoresScreen(),
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
              Tab(icon: Icon(CustomIcons.home, size: 18)),
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
      ),
    );
  }
}
