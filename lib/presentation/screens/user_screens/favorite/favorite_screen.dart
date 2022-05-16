import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_families/business_logic/user/favorite_screen/user_favorite_screen_cubit.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/favorite/favorite_grid_item.dart';
import 'package:productive_families/presentation/widgets/DefaultSvg.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late UserFavoriteScreenCubit _userFavoriteScreenCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserFavoriteScreenCubit()..getAllFavoriteScreenGroups(),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          centerTitle: true,
          title: DefaultText(
            textStyle: Theme.of(context).textTheme.headline5,
            text: 'المفضلة',
          ),
        ),
        body: Column(
          children: [
            Image.asset(
              'assets/image/appbar_half_circle.png',
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    sliver: BlocBuilder<UserFavoriteScreenCubit,
                        UserFavoriteScreenState>(
                      builder: (context, state) {
                        if (state
                            is UserGetAllFavoriteScreenGroupsSuccessState) {
                          return SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) =>  MarketFavoriteItem(groupModel:state.groups[index]),
                                childCount: state.groups.length
                              ),
                              gridDelegate:
                                   SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                      crossAxisCount: 2,
                                      childAspectRatio: 40.w/30.h));
                        } else if (state
                            is UserGetAllFavoriteScreenGroupsLoadingState) {
                          return const SliverFillRemaining(
                              child: DefaultLoadingIndicator());
                        } else if (state
                            is UserGetAllFavoriteScreenGroupsEmptyState) {
                          return const SliverFillRemaining(
                              child: Center(
                                child: DefaultSvg(
                            imagePath: 'assets/icons/add_to_favorite.svg',
                            color: darkBlue,
                                  width: 48,
                                  height: 48,
                          ),
                              ));
                        } else {
                          return const SliverFillRemaining(
                              child: DefaultErrorWidget());
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
