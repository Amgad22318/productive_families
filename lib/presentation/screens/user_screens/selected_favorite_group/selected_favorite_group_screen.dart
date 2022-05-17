import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/selected_favorite_group/selected_favorite_group_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../business_logic/user/selected_favorite_group_screen/selected_favorite_group_screen_cubit.dart';
import '../../../router/arguments/user_arguments/user_selected_favorite_group_args.dart';
import '../../../styles/colors.dart';
import '../../../widgets/DefaultSvg.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';

class SelectedFavoriteGroupScreen extends StatefulWidget {
  final UserSelectedFavoriteGroupArgs userSelectedFavoriteGroupArgs;

  const SelectedFavoriteGroupScreen(
      {Key? key, required this.userSelectedFavoriteGroupArgs})
      : super(key: key);

  @override
  State<SelectedFavoriteGroupScreen> createState() =>
      _SelectedFavoriteGroupScreenState();
}

class _SelectedFavoriteGroupScreenState
    extends State<SelectedFavoriteGroupScreen> {
  late SelectedFavoriteGroupScreenCubit _selectedFavoriteGroupScreenCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectedFavoriteGroupScreenCubit()
        ..getUserFavoritesGroupProduct(
            groupId: widget.userSelectedFavoriteGroupArgs.groupId),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          centerTitle: true,
          actions: [
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
          title: DefaultText(
            text: widget.userSelectedFavoriteGroupArgs.title,
            textStyle: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Column(
          children: [
            const Image(
                image: AssetImage('assets/image/appbar_half_circle.png')),
            Expanded(
              child: CustomScrollView(slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: BlocConsumer<SelectedFavoriteGroupScreenCubit,
                      SelectedFavoriteGroupScreenState>(
                    listener: (context, state) {
                      if (state is UserFavoriteGroupProductDeleteSuccessState) {
                        setState(() {
                          showToastMsg(
                              msg: state.message,
                              toastState: ToastStates.SUCCESS);
                        });

                      } else if (state
                          is UserFavoriteGroupProductDeleteFailState) {
                        showToastMsg(
                            msg: state.message, toastState: ToastStates.ERROR);
                      }
                    },

                    builder: (context, state) {
                      if (state is UserGetFavoriteGroupProductSuccessState ||
                          state is UserFavoriteGroupProductDeleteSuccessState ||
                          state is UserFavoriteGroupProductDeleteFailState) {
                        _selectedFavoriteGroupScreenCubit =
                            SelectedFavoriteGroupScreenCubit.get(context);
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => SelectedFavoriteGroupItem(
                                    productModel:
                                        _selectedFavoriteGroupScreenCubit
                                            .userFavoritesGroupProductModel
                                            .products[index],
                                    selectedFavoriteGroupScreenCubit:
                                        _selectedFavoriteGroupScreenCubit,
                                    groupId: widget
                                        .userSelectedFavoriteGroupArgs.groupId,
                                    index: index,
                                  ),
                              childCount: _selectedFavoriteGroupScreenCubit
                                  .userFavoritesGroupProductModel
                                  .products
                                  .length),
                        );
                      } else if (state
                          is UserGetFavoriteGroupProductLoadingState) {
                        return const SliverFillRemaining(
                            child: DefaultLoadingIndicator());
                      } else if (state
                          is UserGetFavoriteGroupProductEmptyState) {
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
              ]),
            )
          ],
        ),
      ),
    );
  }
}
