import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/home_grid_view_item.dart';
import 'package:productive_families/presentation/views/home_section_item.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset('assets/icons/contact.svg'),
        backgroundColor: Colors.white,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultFormField(
                      radius: 16,
                      backgroundColor: formFieldBackGroundGrey,
                      hintText: 'إبحث عن متجر / طبق..',
                      controller: searchController,
                      validator: (text) {},
                      keyboardType: TextInputType.text),
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
                                textStyle: Theme.of(context).textTheme.caption,
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
            SizedBox(
              height: 82,
              child: Column(
                children: [
                  Container(
                    color: Colors.grey,
                    height: 0.5,
                    width: double.infinity,
                  ),
                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => HomeSectionItem(),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: 20),
                  ),
                  Container(
                    color: Colors.grey,
                    height: 0.5,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 8.0),
                        child: DefaultText(
                          maxLines: 2,
                          text: 'الاعلى تقييما',
                          textStyle: Theme.of(context).textTheme.headline6,
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
                  ListView(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                    children: [
                      HomeGridViewItem(),
                      HomeGridViewItem(),
                      HomeGridViewItem(),
                      HomeGridViewItem(),
                      HomeGridViewItem(),
                    ],
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
