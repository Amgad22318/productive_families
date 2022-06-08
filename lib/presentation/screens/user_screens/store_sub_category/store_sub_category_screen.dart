import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/business_logic/user/store_sub_category/user_store_sub_category_cubit.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/widgets/DefaultSvg.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/models/user_models/stores/user_store_sub_category_model.dart';
import '../../../router/arguments/user_arguments/store_sub_category_args.dart';
import '../../../styles/colors.dart';
import '../../../styles/custom_icons.dart';
import '../../../views/screen_views/user_screen_views/store_sub_category/store_sub_category_item.dart';
import '../../../widgets/default_error_widget.dart';
import '../../../widgets/default_loading_indicator.dart';

class StoreSubCategoryScreen extends StatefulWidget {
  final StoreSubCategoryArgs storeSubCategoryArgs;

  const StoreSubCategoryScreen({Key? key, required this.storeSubCategoryArgs, })
      : super(key: key);

  @override
  State<StoreSubCategoryScreen> createState() => _StoreSubCategoryScreenState();
}

class _StoreSubCategoryScreenState extends State<StoreSubCategoryScreen> with SingleTickerProviderStateMixin {
  late UserStoreSubCategoryCubit userStoreSubCategoryCubit;
  late final TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    controller.index = 1;    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserStoreSubCategoryCubit()
        ..getStoreSubCategory(providerId: widget.storeSubCategoryArgs.providerId),
      child: Builder(builder: (context) {
        userStoreSubCategoryCubit = UserStoreSubCategoryCubit.get(context);
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: FloatingActionButton(
            child:
                DefaultSvg(imagePath: 'assets/icons/chat.svg', height: 18.sp),
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, SELLER_CHAT_SCREEN);
            },
          ),
          appBar: DefaultShopAppbar(
            centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
                )
              ],
            title: DefaultText(
              textStyle: Theme.of(context).textTheme.headline5,
              text: widget.storeSubCategoryArgs.serviceName,
            )
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      sliver: BlocBuilder<UserStoreSubCategoryCubit,
                          UserStoreSubCategoryStates>(
                        builder: (context, state) {
                          if (state is UserGetStoreSubCategorySuccessState) {
                            Store subCategoryStoreModel =
                                userStoreSubCategoryCubit
                                    .userStoreSubCategoryModel!.store!;
                            return SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => StoreSubCategoryItem(
                                  providerId: subCategoryStoreModel.id,
                                  subCategoriesModel:
                                      subCategoryStoreModel.subCategories[index],
                                ),
                                childCount:
                                    subCategoryStoreModel.subCategories.length,
                              ),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 16,
                                      crossAxisSpacing: 16,
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.85),
                            );
                          }
                          else if (state
                              is UserGetStoreSubCategoryLoadingState) {
                            return const SliverFillRemaining(
                                child: DefaultLoadingIndicator());
                          } else {
                            return const SliverFillRemaining(
                                child: DefaultErrorWidget());
                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          bottomNavigationBar: Material(
            color: darkBlue,
            child: TabBar(
              controller: controller,
              onTap: (index) {
                if(index==0){
                  Navigator.pushNamedAndRemoveUntil(context, SHOP_LAYOUT, (route) => false,arguments: 0);
                }
                else if(index==1){
                  Navigator.pushNamedAndRemoveUntil(context, SHOP_LAYOUT, (route) => false,arguments: 1);
                }
                else if(index==2){
                  Navigator.pushNamedAndRemoveUntil(context, SHOP_LAYOUT, (route) => false,arguments: 2);
                }
                else if(index==3){
                  Navigator.pushNamedAndRemoveUntil(context, SHOP_LAYOUT, (route) => false,arguments: 3);
                }
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
        );
      }),
    );
  }
}
