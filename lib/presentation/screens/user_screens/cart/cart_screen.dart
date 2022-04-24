import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/business_logic/user/cart_get_data/user_cart_get_data_cubit.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../business_logic/user/cart/user_cart_modifying_cubit.dart';
import '../../../views/screen_views/user_screen_views/basket/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late UserCartGetDataCubit userCartGetDataCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCartGetDataCubit()..getCartProducts(),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                color: Colors.black,
              ),
            )
          ],
          title: DefaultText(
              text: 'السله', textStyle: Theme.of(context).textTheme.headline6),
        ),
        body: Column(
          children: [
            const Image(
                image: AssetImage('assets/image/appbar_half_circle.png')),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    sliver: Builder(builder: (context) {
                      userCartGetDataCubit =
                          UserCartGetDataCubit.get(context);
                      return BlocBuilder<UserCartGetDataCubit,
                          UserCartGetDataState>(

                        builder: (context, state) {
                          if (state is UserGetCartProductSuccessState ||state is UserCartItemRemovedState) {
                            return SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) => CartItem(userCartGetDataCubit: userCartGetDataCubit,
                                        productModel:
                                            userCartGetDataCubit
                                                .userShowCartProductsModel!
                                                .products![index],
                                        index: index),
                                    childCount: userCartGetDataCubit
                                        .userShowCartProductsModel!
                                        .products!
                                        .length));
                          } else if (state is UserGetCartProductLoadingState) {
                            return const SliverFillRemaining(
                                child: DefaultLoadingIndicator());
                          } else if (state is UserGetCartProductEmptyState) {
                            return const SliverFillRemaining(
                                child: Icon(Icons.add_shopping_cart,size: 48,));
                          }
                          else {
                            return const SliverFillRemaining(
                                child: DefaultErrorWidget());
                          }
                        },
                      );
                    }),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Flexible(
                              flex: 10,
                              child: DefaultOutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, SHOP_LAYOUT, (route) => false);
                                },
                                text: 'إضافة عناصر',
                              )),
                          const Spacer(
                            flex: 1,
                          ),
                          Flexible(
                              flex: 10,
                              child: DefaultMaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ORDER_CONFIRMATION_SCREEN);
                                },
                                text: 'تأكيد الطلب',
                              )),
                        ],
                      ),
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
