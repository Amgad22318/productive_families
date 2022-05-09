import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/order_follow_up_item.dart';
import 'package:productive_families/presentation/widgets/DefaultSvg.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../business_logic/user/order_tracks/user_order_tracks_cubit.dart';
import '../../../styles/colors.dart';

class UserOrderTracksScreen extends StatefulWidget {
  final int orderId;

  const UserOrderTracksScreen({Key? key, required this.orderId})
      : super(key: key);

  @override
  State<UserOrderTracksScreen> createState() => _UserOrderTracksScreenState();
}

class _UserOrderTracksScreenState extends State<UserOrderTracksScreen> {
  late UserOrderTracksCubit _userOrderTracksCubit;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamedAndRemoveUntil(
            context, USER_ALL_ORDERS_SCREEN, (route) => false);
        return true;
      },
      child: BlocProvider(
        lazy: false,
        create: (context) =>
            UserOrderTracksCubit()..getOrderTracks(orderId: widget.orderId),
        child: Scaffold(
          appBar: DefaultShopAppbar(
            height: 80,
            centerTitle: true,
            actions: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/back_arrow.svg",
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, USER_ALL_ORDERS_SCREEN, (route) => false);
                  })
            ],
            title: const DefaultText(
              text: 'متابعة الطلب',
              textStyle: TextStyle(),
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: <Color>[
                              Color(0xFFFFDC2A),
                              Color(0xFFFFF2B3),
                            ],
                          ),
                        ),
                        // child: const Center(child: Text('map')),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Container(
                        color: Colors.white,

                        // child: const Center(child: Text('map')),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: BlocBuilder<UserOrderTracksCubit, UserOrderTracksState>(
                    builder: (context, state) {
                if (state is UserGetOrderTracksSuccessState) {
                  _userOrderTracksCubit=UserOrderTracksCubit.get(context);

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/clock.svg",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Visibility(
                          visible: _userOrderTracksCubit.userOrderTracksModel.deliveryTime!=0 ,
                          child: Column(
                            children: [
                              DefaultText(
                                  text: _userOrderTracksCubit.userOrderTracksModel.deliveryTime.toString()+ ' دقيقة',
                                  textStyle: Theme.of(context).textTheme.bodyText1),
                              const SizedBox(
                                height: 5,
                              ),
                              DefaultText(
                                  text: 'ميعاد التوصيل',
                                  textStyle: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    OrderFollowUpItem(
                                      trackModel:
                                        _userOrderTracksCubit.userOrderTracksModel.tracks[index]
                                    ),
                                itemCount:  _userOrderTracksCubit.userOrderTracksModel.tracks.length,
                                separatorBuilder: (BuildContext context,
                                        int index) =>
                                    const Align(
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 9.0),
                                        child: DefaultSvg(
                                          imagePath:
                                              'assets/icons/dotted_barline.svg',
                                          color: grey3,
                                          height: 20,
                                        ),
                                      ),
                                    )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40.0, horizontal: 20),
                          child: DefaultMaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ORDER_LOCATION_FOLLOW_UP_SCREEN);
                            },
                            text: 'متابعة الطلب على الخريطه',
                          ),
                        )
                      ],
                    ),
                  );
                }
                else if (state is UserGetOrderTracksLoadingState){
                  return const DefaultLoadingIndicator();
                }
                else{
                  return const DefaultErrorWidget();
                }
                    },
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
