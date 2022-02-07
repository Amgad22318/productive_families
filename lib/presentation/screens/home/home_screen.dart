import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/home_first_section_item.dart';
import 'package:productive_families/presentation/views/home_grid_view_item.dart';
import 'package:productive_families/presentation/views/home_section_item.dart';
import 'package:productive_families/presentation/views/navigation_drawer.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(
        'https://dribbble.com/shots/2444148-A-B-Testing/attachments/9303579?mode=media');
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const NavigationDrawer(),
      appBar: DefaultShopAppbar(
        actions: [
          IconButton(
              onPressed: () {},
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
        child: SvgPicture.asset('assets/icons/contact.svg'),
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
                        InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          onTap: () {
                            Navigator.pushNamed(context, SEARCH_SCREEN);
                          },
                          child: Container(
                            alignment: AlignmentDirectional.centerStart,
                            decoration: BoxDecoration(
                                color: formFieldBackGroundGrey,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            width: double.infinity,
                            height: 50,
                            child: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(start: 8.0),
                              child: DefaultText(
                                textAlign: TextAlign.start,
                                text: 'إبحث عن متجر / طبق..',
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                color: Colors.grey,
                              ),
                            ),
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
                      Container(
                        color: Colors.grey,
                        height: 0.5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            HomeFirstSectionItem(),

                            Row(
                              children: List.generate(20, (index) {
                                return HomeSectionItem();
                              }),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 0.5,
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
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/filter-line.svg',
                                  width: 16,
                                  height: 16,
                                )),
                          ],
                        ),
                        ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            const HomeGridViewItem(),
                            const HomeGridViewItem(),
                            const HomeGridViewItem(),
                            const HomeGridViewItem(),
                            const HomeGridViewItem(),
                          ],
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
