//        implementing

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_families/constants/constants.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/data/models/user_models/orders/user_show_cart_products_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/DefaultSvg.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business_logic/user/cart/user_cart_modifying_cubit.dart';
import '../../../../../business_logic/user/cart_get_data/user_cart_get_data_cubit.dart';

class CartItem extends StatefulWidget {
  final Products productModel;
  final int index;
  final UserCartGetDataCubit userCartGetDataCubit;

  const CartItem(
      {Key? key,
      required this.productModel,
      required this.index,
      required this.userCartGetDataCubit})
      : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int productQuantity;
  late Timer _timer;
  late UserCartModifyingCubit userCartDataAndModifyingCubit;

  @override
  void initState() {
    _timer = Timer(const Duration(milliseconds: 200), () {});
    productQuantity = widget.productModel.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.textScaleFactorOf(context);

    return BlocProvider(
      create: (context) => UserCartModifyingCubit(),
      child: Builder(builder: (context) {
        userCartDataAndModifyingCubit = UserCartModifyingCubit.get(context);
        return BlocConsumer<UserCartModifyingCubit, UserCartModifyingStates>(
          listener: (context, state) {
            if (state is UserDeleteFromProductCartSuccessState) {
              widget.userCartGetDataCubit.removeItem(state.index);

            }
          },
          buildWhen: (previous, current) {
            if (current is UserModifyCartProductQuantitySuccessState) {
              if (current.cartId == widget.productModel.cartId) {
                return true;
              } else {
                return false;
              }
            } else {
              return false;
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: LimitedBox(
                  maxHeight: textScale * 20.h,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 15,
                          child: SizedBox.expand(
                            child: DefaultCachedNetworkImage(
                                imageUrl: widget.productModel.image.path!,
                                fit: BoxFit.cover),
                          )),
                      const Spacer(),
                      Expanded(
                        flex: 25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: widget.productModel.productName,
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              fontWeight: FontWeights.bold,

                              // textStyle: TextStyle(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: orderFormFieldBackGroundGrey),
                                      child: BlocListener<
                                          UserCartModifyingCubit,
                                          UserCartModifyingStates>(
                                        listener: (context, state) {
                                          if (state
                                              is UserModifyCartProductQuantitySuccessState) {
                                            if (widget.productModel.cartId ==
                                                state.cartId) {
                                              setState(() {
                                                productQuantity =
                                                    state.quantity;
                                              });
                                            }
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                incrementProductQuantity();
                                                userCartDataAndModifyingCubit
                                                    .modifyCartProductQuantity(
                                                        cartId: widget
                                                            .productModel
                                                            .cartId,
                                                        quantity:
                                                            productQuantity);
                                              },
                                              onLongPressEnd: (details) {
                                                userCartDataAndModifyingCubit
                                                    .modifyCartProductQuantity(
                                                        cartId: widget
                                                            .productModel
                                                            .cartId,
                                                        quantity:
                                                            productQuantity);
                                              },
                                              onLongPressStart: (details) {
                                                _timer = Timer.periodic(
                                                    const Duration(
                                                        milliseconds: 200),
                                                    (t) {
                                                  incrementProductQuantity();
                                                });
                                              },
                                              onLongPressCancel: () {
                                                _timer.cancel();
                                              },
                                              onLongPressUp: () {
                                                _timer.cancel();
                                              },
                                              child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                height: 32,
                                                width: 32,
                                                decoration: BoxDecoration(
                                                    color: darkBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: backGroundWhite,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Center(
                                                child: DefaultText(
                                                  text: productQuantity
                                                      .toString(),
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2,
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                decrementProductQuantity();
                                                userCartDataAndModifyingCubit
                                                    .modifyCartProductQuantity(
                                                        cartId: widget
                                                            .productModel
                                                            .cartId,
                                                        quantity:
                                                            productQuantity);
                                              },
                                              onLongPressEnd: (details) {
                                                userCartDataAndModifyingCubit
                                                    .modifyCartProductQuantity(
                                                        cartId: widget
                                                            .productModel
                                                            .cartId,
                                                        quantity:
                                                            productQuantity);
                                              },
                                              onLongPressStart: (details) {
                                                _timer = Timer.periodic(
                                                    const Duration(
                                                        milliseconds: 200),
                                                    (t) {
                                                  decrementProductQuantity();
                                                });
                                              },
                                              onLongPressCancel: () {
                                                _timer.cancel();
                                              },
                                              onLongPressUp: () {
                                                _timer.cancel();
                                              },
                                              child: Container(
                                                clipBehavior: Clip.antiAlias,
                                                height: 32,
                                                width: 32,
                                                decoration: BoxDecoration(
                                                    color: darkBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40)),
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: backGroundWhite,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                DefaultIconButton(
                                    background: Colors.transparent,
                                    onPressed: () {
                                      userCartDataAndModifyingCubit
                                          .userDeleteProductFromCart(
                                              cartId:
                                                  widget.productModel.cartId,
                                              index: widget.index);
                                    },
                                    icon: const DefaultSvg(
                                        imagePath: "assets/icons/delete.svg",
                                        color: Color(0xFFFF0000))),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DefaultText(
                              text: widget.productModel.price.toString() +
                                  ' $AppCurrencyShortcut',
                              textStyle: Theme.of(context).textTheme.bodyText2,
                              fontWeight: FontWeights.bold,
                              color: defaultYellow,
                            ),
                            DefaultText(
                              text: widget.productModel.description,
                              textStyle: Theme.of(context).textTheme.bodyText2,
                              maxLines: 4,
                              color: lightBlue,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  void incrementProductQuantity() {
    setState(() {
      if (productQuantity < 99) {
        productQuantity++;
      } else {}
    });
  }

  void decrementProductQuantity() {
    setState(() {
      if (productQuantity > 1) {
        productQuantity--;
      } else {}
    });
  }
}
