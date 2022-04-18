import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/business_logic/user/store_sub_category/user_store_sub_category_cubit.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/shared/category_item.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../data/models/user_models/stores/user_store_sub_category_model.dart';
import '../../../views/screen_views/user_screen_views/store_sub_category/store_sub_category_item.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';

class StoreSubCategoryScreen extends StatefulWidget {
  final int providerId;

  const StoreSubCategoryScreen({Key? key, required this.providerId})
      : super(key: key);

  @override
  State<StoreSubCategoryScreen> createState() => _StoreSubCategoryScreenState();
}

class _StoreSubCategoryScreenState extends State<StoreSubCategoryScreen> {
  late UserStoreSubCategoryCubit userStoreSubCategoryCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserStoreSubCategoryCubit()
        ..getStoreSubCategory(providerId: widget.providerId),
      child: Builder(builder: (context) {
        userStoreSubCategoryCubit = UserStoreSubCategoryCubit.get(context);
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton(
            child: SvgPicture.asset('assets/icons/chat.svg'),
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, SELLER_CHAT_SCREEN);
            },
          ),
          appBar: DefaultShopAppbar(
            centerTitle: true,
            title: DefaultText(
              textStyle: Theme.of(context).textTheme.headline5,
              text: 'إسم الأسرة',
            ),
          ),
          body: Column(
            children: [
              Image.asset(
                'assets/image/appbar_half_circle.png',
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 8.0, start: 8, end: 8),
                  child: CustomScrollView(
                    slivers: [
                      BlocBuilder<UserStoreSubCategoryCubit,
                          UserStoreSubCategoryStates>(
                        builder: (context, state) {
                          if (state is UserGetStoreSubCategorySuccessState) {
                            Store subCategoryStoreModel =
                                userStoreSubCategoryCubit
                                    .userStoreSubCategoryModel!.store;
                            return SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => StoreSubCategoryItem(
                                  providerId: subCategoryStoreModel.providerId,
                                  subCategoriesModel: subCategoryStoreModel
                                      .subCategories[index],
                                ),
                                childCount: subCategoryStoreModel
                                    .subCategories.length,
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.75),
                            );
                          } else if (state
                              is UserGetStoreSubCategoryLoadingState) {
                            return const SliverToBoxAdapter(child:  DefaultLoadingIndicator());
                          } else {
                            return const SliverToBoxAdapter(child:  DefaultErrorWidget());
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
