import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/business_logic/user/all_orders/user_all_orders_cubit.dart';
import 'package:productive_families/business_logic/user/product_rates/user_product_rates_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/presentation/widgets/default_edge_notification_listner.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';

import '../../../views/screen_views/user_screen_views/about_product/about_product_review_item.dart';
import '../../../widgets/default_shop_appbar.dart';
import '../../../widgets/default_text.dart';

class UserProductAllReviewsScreen extends StatefulWidget {
  final int productId;

  const UserProductAllReviewsScreen({Key? key, required this.productId})
      : super(key: key);

  @override
  State<UserProductAllReviewsScreen> createState() =>
      _UserProductAllReviewsScreenState();
}

class _UserProductAllReviewsScreenState
    extends State<UserProductAllReviewsScreen> {
  late UserProductRatesCubit _userProductRatesCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProductRatesCubit()
        ..getProductRates(
          productId: widget.productId,
        ),
      child: Builder(builder: (context) {
        _userProductRatesCubit = UserProductRatesCubit.get(context);
        return Scaffold(
          appBar: DefaultShopAppbar(
            centerTitle: true,
            title: DefaultText(
              textStyle: Theme.of(context).textTheme.headline5,
              text: 'تقييمات المنتج',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset('assets/icons/back_arrow.svg'))
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/image/appbar_half_circle.png',
              ),
              Expanded(
                child:
                    BlocBuilder<UserProductRatesCubit, UserProductRatesState>(
                  builder: (context, state) {
                    if (state is UserGetProductRatesSuccessState) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: DefaultEdgeNotificationListener(
                          onBottom: () {
                            _userProductRatesCubit.getProductRatesLoadMore(
                                productId: widget.productId,
                                page: _userProductRatesCubit.currentPage);
                          },
                          child: ListView.builder(
                            itemCount: _userProductRatesCubit
                                .productRatesModel.reviews.length,
                            itemBuilder: (context, index) =>
                                AboutProductReviewItem(
                              reviewModel: _userProductRatesCubit
                                  .productRatesModel.reviews[index],
                            ),
                          ),
                        ),
                      );
                    } else if (state is UserGetAllOrdersEmptyState) {
                      return const Center(
                          child: Icon(
                        Icons.playlist_add,
                        size: 48,
                      ));
                    } else if (state is UserGetProductRatesLoadingState) {
                      return const DefaultLoadingIndicator();
                    } else {
                      return const DefaultErrorWidget();
                    }
                  },
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
