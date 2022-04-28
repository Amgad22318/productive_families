import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/business_logic/user/all_orders/user_all_orders_cubit.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/all_orders_item.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class UserAllOrdersScreen extends StatefulWidget {
  const UserAllOrdersScreen({Key? key}) : super(key: key);

  @override
  State<UserAllOrdersScreen> createState() => _UserAllOrdersScreenState();
}

class _UserAllOrdersScreenState extends State<UserAllOrdersScreen> {
  late UserAllOrdersCubit userAllOrdersCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserAllOrdersCubit()..getAllOrders(),
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, SHOP_LAYOUT, (route) => false);

          return true;
        },
        child: Scaffold(
          appBar: DefaultShopAppbar(
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, SHOP_LAYOUT, (route) => false);
                },
                padding: EdgeInsetsDirectional.zero,
                icon: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  color: darkBlue,
                ),
              ),
            ],
            title: const DefaultText(
              text: 'طلباتك',
              textStyle: TextStyle(),
            ),
          ),
          body: Column(
            children: [
              const Image(
                  image: AssetImage('assets/image/appbar_half_circle.png')),
              Expanded(
                  child: BlocConsumer<UserAllOrdersCubit, UserAllOrdersState>(
                listener: (context, state) {
                  if (state is UserCancelOrderSuccessState) {
                    userAllOrdersCubit.userAllOrdersModel.orders.removeAt(state.itemIndex);
                  }
                },
                builder: (context, state) {
                  if (state is UserGetAllOrdersSuccessState||state is UserCancelOrderSuccessState) {
                    userAllOrdersCubit = UserAllOrdersCubit.get(context);
                    return ListView.builder(
                      itemCount:
                          userAllOrdersCubit.userAllOrdersModel.orders.length,
                      itemBuilder: (context, index) => AllOrdersItem(
                          orderModel: userAllOrdersCubit
                              .userAllOrdersModel.orders[index],
                          userAllOrdersCubit: userAllOrdersCubit,
                          itemIndex: index),
                    );
                  }
                  else if (state is UserGetAllOrdersLoadingState||state is UserCancelOrderLoadingState) {
                    return const DefaultLoadingIndicator();
                  }
                  else if (state is UserGetAllOrdersEmptyState) {
                    return Icon(
                      Icons.playlist_add,
                      size: 48.sp,
                    );
                  }
                  else {
                    return const DefaultErrorWidget();
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
