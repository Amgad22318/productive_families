import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productive_families/business_logic/user/local/user_local_cubit.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/profile/profile_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserLocalCubit, UserLocalStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultShopAppbar(
            height: 200,
            centerTitle: true,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 32,
                    ),
                    DefaultText(
                      text: 'مستخدم',
                      textStyle: Theme.of(context).textTheme.headline5,
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => ProfileBottomSheet(
                              accountType: 'مستخدم',
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          size: 20,
                        ))
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: DefaultCachedNetworkImage(
                        imageUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5UO5EcFlZOu7qvA9jHM0B8SwFoBpRrHkb7A&usqp=CAU',
                        fit: BoxFit.cover,
                        width: 140,
                        height: 140,
                      ),
                    ),
                    DefaultIconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_camera_outlined,
                        color: Colors.white,
                      ),
                      background: darkBlue,
                      radius: 24,
                    )
                  ],
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                DefaultFormField(
                  hintText: '',
                  textColor: darkBlue,
                  height: 60,
                  horizontalPadding: 32,
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  backgroundColor: Colors.transparent,
                  labelText: 'الأسم',
                  inputEnabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: darkBlue,
                    ),
                  ),
                  inputFocusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: darkBlue),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DefaultFormField(
                  hintText: '',
                  textColor: darkBlue,
                  height: 60,
                  horizontalPadding: 32,
                  controller: phoneController,
                  keyboardType: TextInputType.text,
                  backgroundColor: Colors.transparent,
                  labelText: 'رقم الهاتف',
                  inputEnabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: darkBlue,
                    ),
                  ),
                  inputFocusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: darkBlue),
                  ),
                  suffixIcon: SizedBox(
                    height: 24,
                    width: 24,
                    child: IconButton(
                        onPressed: () {},
                        padding: EdgeInsetsDirectional.zero,
                        iconSize: 18,
                        icon: const Icon(
                          Icons.edit,
                          color: darkBlue,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                DefaultFormField(
                  height: 60,
                  labelText: 'العنوان',
                  hintText: '',
                  textColor: darkBlue,
                  horizontalPadding: 32,
                  controller: locationController,
                  keyboardType: TextInputType.text,
                  backgroundColor: Colors.transparent,
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 51,
                    onPressed: () {
                      Navigator.pushNamed(context, SPECIFY_LOCATION);
                    },
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: DefaultText(
                            textScaleFactor: 1,
                            text: 'تغيير',
                            textStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          color: darkBlue,
                          width: 24,
                          height: 24,
                        )
                      ],
                    ),
                  ),
                  inputEnabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: darkBlue,
                    ),
                  ),
                  inputFocusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: darkBlue),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/points.svg',
                              height: 24,
                              width: 24,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: DefaultText(
                                text: '41',
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            DefaultText(
                              text: 'عدد النقاط',
                              color: greyText,
                              textStyle: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            CircularPercentIndicator(
                              circularStrokeCap: CircularStrokeCap.round,
                              lineWidth: 13.0,
                              animation: true,
                              progressColor: defaultYellow,
                              percent: 0.35,
                              backgroundColor: Colors.grey,
                              radius: 60,
                              center: DefaultText(
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                text: '35\nطلب',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/coin.svg',
                              width: 24,
                              height: 24,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: DefaultText(
                                text: '12000.00',
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                textScaleFactor: 0.9,
                              ),
                            ),
                            DefaultText(
                              text: 'رصيد',
                              textStyle: Theme.of(context).textTheme.bodyText2,
                              color: greyText,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 16, end: 16, bottom: 32),
                  child: DefaultMaterialButton(
                    height: 50,
                    onPressed: () {},
                    text: 'حفظ التغييرات',
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
