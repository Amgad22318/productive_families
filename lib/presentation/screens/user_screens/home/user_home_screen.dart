import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/business_logic/user/category/user_category_cubit.dart';
import 'package:productive_families/business_logic/user/category/user_category_state.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/screens/user_screens/search/user_product_search_screen.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/home/home_first_section_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/home/home_section_item.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/home/navigation_drawer.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/home/user_home_list_item.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_search_bar.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:video_player/video_player.dart';

import '../../../../business_logic/user/local/user_local_cubit.dart';
import '../../../../data/models/user_models/category/user_all_categories_model.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  TextEditingController searchController = TextEditingController();

  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(
        'https://dribbble.com/shots/2444148-A-B-Testing/attachments/9303579?mode=media');
    super.initState();
  }

  final TextEditingController _searchController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UserLocalCubit userLocalCubit = UserLocalCubit.get(context);
    UserCategoryCubit userCategoryCubit = UserCategoryCubit.get(context);

    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavigationDrawer(),
      appBar: DefaultShopAppbar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, NOTIFICATIONS_SCREEN);
              },
              icon: SvgPicture.asset(
                'assets/icons/bell.svg',
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, BASKET_SCREEN);
              },
              icon: SvgPicture.asset(
                'assets/icons/shopping-cart-outline-badged.svg',
              )),
        ],
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset(
          'assets/icons/customer_services.svg',
          height: 30,
        ),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, CUSTOMER_SERVICES_CHAT_SCREEN);
        },
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/image/appbar_half_circle.png',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultText(
                          color: greyText,
                          text: 'مرحبا ( إسم المستخدم )',
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        Form(
                          key: searchFormKey,
                          child: DefaultSearchBar(
                            height: null,
                            textColor: darkBlue,
                            backgroundColor: orderFollowUpGreyCheck,
                            controller: _searchController,
                            keyboardType: TextInputType.text,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'البحث فارغ';
                              }
                            },
                            onFieldSubmitted: (text) {
                              if (searchFormKey.currentState!.validate()) {
                                navigateTo(context,
                                    UserProductSearchScreen(searchText: text));
                              }
                            },
                          ),
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Container(
                                  height: 220,
                                  width: double.infinity,
                                  foregroundDecoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.3)
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: const [0, 0.7, 1],
                                    ),
                                  ),
                                  child: VideoPlayer(videoPlayerController)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10),
                              child: Container(
                                padding: const EdgeInsetsDirectional.all(8),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    DefaultText(
                                      color: darkBlue,
                                      text: 'الفكرة الرئيسية للمشروع',
                                      textStyle:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                    DefaultText(
                                      maxLines: 2,
                                      text:
                                          'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة سهلة  الاستخدام لطالبي خدماتهم و على أن يكون احترافى يسمح بالتواصل بشكل منظم ومرن',
                                      textStyle:
                                          Theme.of(context).textTheme.caption,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8.0),
                          child: DefaultText(
                            maxLines: 2,
                            text: 'الأقسام',
                            textStyle: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Divider(
                        color: Colors.grey,
                        height: 0.7,
                      ),
                      BlocBuilder<UserCategoryCubit, UserCategoryStates>(
                        builder: (context, state) {
                          if (state is UserGetAllCategoriesSuccessState) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  HomeFirstSectionItem(),
                                  Row(
                                    children: List.generate(userCategoryCubit.userAllCategoriesModel!.categories.length, (index) {
                                      return HomeSectionItem(category: userCategoryCubit.userAllCategoriesModel!.categories[index]);
                                    }),
                                  ),
                                ],
                              ),
                            );
                          }
                          else   if (state is UserGetAllCategoriesLoadingState){
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical:20),
                              child: DefaultLoadingIndicator(),
                            );
                          }
                          else{return const Center(child: DefaultErrorWidget());}
                        },
                      ),
                      const Divider(
                        color: Colors.grey,
                        height: 0.7,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 8.0),
                              child: DefaultText(
                                maxLines: 2,
                                text: 'الاعلى تقييما',
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder<UserLocalCubit, UserLocalStates>(
                          builder: (context, state) {
                            if (userLocalCubit.userTopRatedProductsModel !=
                                    null &&
                                userLocalCubit.userTopRatedProductsModel!
                                    .products.isNotEmpty) {
                              return ListView.builder(
                                itemCount: userLocalCubit
                                    .userTopRatedProductsModel?.products.length,
                                itemBuilder: (context, index) =>
                                    UserHomeListItem(
                                        productModel: userLocalCubit
                                            .userTopRatedProductsModel!
                                            .products[index]),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
