import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/business_logic/user/home_product_search/home_product_search_cubit.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/search/product_search_grid_item.dart';
import 'package:productive_families/presentation/widgets/DefaultSvg.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_search_bar.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constant_methods.dart';

class UserProductSearchScreen extends StatefulWidget {
  const UserProductSearchScreen({Key? key, this.searchText}) : super(key: key);
  final String? searchText;

  @override
  State<UserProductSearchScreen> createState() =>
      _UserProductSearchScreenState();
}

class _UserProductSearchScreenState extends State<UserProductSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController productGridController = ScrollController();
  bool loading = false;

  @override
  void initState() {
    _searchController.text = widget.searchText ?? '';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  late UserProductSearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProductSearchCubit()
        ..userProductSearch(keyWord: _searchController.text, page: 1),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          centerTitle: true,
          title: DefaultText(
            textStyle: Theme.of(context).textTheme.headline5,
            text: 'بحث',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
          ],
        ),
        body: BlocConsumer<UserProductSearchCubit, UserProductSearchStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Builder(builder: (context) {
              searchCubit = UserProductSearchCubit.get(context);
              productGridController.addListener(() {
                if (productGridController.position.pixels >=
                        productGridController.position.maxScrollExtent &&
                    !searchCubit.isLoadingMoreData) {

                  searchCubit.userProductSearch(
                      keyWord: _searchController.text, page: searchCubit.nextPage);
                }
              });

              return Column(
                children: [
                  Image.asset(
                    'assets/image/appbar_half_circle.png',
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: BlocConsumer<UserProductSearchCubit,
                        UserProductSearchStates>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        return DefaultSearchBar(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          textColor: darkBlue,
                          backgroundColor: orderFollowUpGreyCheck,
                          controller: _searchController,
                          keyboardType: TextInputType.text,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'البحث فارغ';
                            }
                          },
                          onFieldSubmitted: (text) {
                            searchCubit.userProductSearch(
                                keyWord: _searchController.text, page: 1);
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: BlocBuilder<UserProductSearchCubit,
                          UserProductSearchStates>(
                        builder: (context, state) {
                          if (state is UserProductSearchSuccessState) {
                            return GridView.count(
                              controller: productGridController,
                              crossAxisCount: 2,
                              crossAxisSpacing: 6,
                              mainAxisSpacing: 6,
                              childAspectRatio:40.w / 22.h,
                              children: List.generate(
                                  searchCubit
                                      .userProductSearchModel!.products.length,
                                  (index) => ProductSearchGridItem(
                                      productModel: searchCubit
                                          .userProductSearchModel!
                                          .products[index])),
                            );
                          }
                          else if (state is UserProductSearchLoadingState) {
                            return const DefaultLoadingIndicator();
                          } else if (state is UserProductSearchEmptyState) {
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DefaultSvg(
                                    imagePath:
                                        'assets/icons/no_search_data.svg',
                                    height: 50.sp,
                                    color: darkBlue,
                                  ),
                                  DefaultText(
                                    text: 'لم يتم العثور على نتائج',
                                    fontWeight: FontWeight.bold,
                                    textStyle:
                                        Theme.of(context).textTheme.headline6,
                                  )
                                ],
                              ),
                            );
                          } else {
                            return const DefaultErrorWidget();
                          }
                        },
                      ),
                    ),
                  )
                ],
              );
            });
          },
        ),
      ),
    );
  }
}
