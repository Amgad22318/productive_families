import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/delivery_representative_screen_views/home/dr_home_list_itme.dart';
import 'package:productive_families/presentation/views/screen_views/market_owner_screen_views/home/mo_current_orders_and_home_list_itme.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/home/navigation_drawer.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/default_text_button.dart';
import 'package:video_player/video_player.dart';

class MarketOwnerHomeScreen extends StatefulWidget {
  const MarketOwnerHomeScreen({Key? key}) : super(key: key);

  @override
  State<MarketOwnerHomeScreen> createState() =>
      _DeliveryRepresentativeHomeScreenState();
}

class _DeliveryRepresentativeHomeScreenState
    extends State<MarketOwnerHomeScreen> {
  TextEditingController searchController = TextEditingController();

  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(
        'https://dribbble.com/shots/2444148-A-B-Testing/attachments/9303579?mode=media');
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavigationDrawer(),
      appBar: DefaultShopAppbar(
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamed(context, NOTIFICATIONS_SCREEN);
              },
              icon: SvgPicture.asset(
                'assets/icons/bell.svg',
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
                          child: Row(
                            children: [
                              DefaultText(
                                maxLines: 2,
                                text: 'الطلبات الحاليه',
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                              ),
                              const Spacer(),
                              DefaultTextButton(
                                text: 'مشاهدة الكل',
                                textDecoration: TextDecoration.none,
                                textStyle: Theme.of(context).textTheme.caption,
                                textColor: greyText,
                                onPressed: () { Navigator.pushNamed(context, MARKET_OWNER_CURRENT_ORDERS_SCREEN);},
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(10,
                                (index) => MarketOwnerCurrentOrdersAndHomeListItem()))
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
