import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/profile/profile_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerUserProfileScreen extends StatelessWidget {
  MarketOwnerUserProfileScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController serviceNameController = TextEditingController();

  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                  text: 'متجر',
                  textStyle: Theme.of(context).textTheme.headline5,
                ),
                IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) =>  ProfileBottomSheet(accountType: 'متجر',),
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
                const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/image/user_photo.png')),
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
              validator: (text) {},
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
              validator: (text) {},
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
              validator: (text) {},
              keyboardType: TextInputType.text,
              backgroundColor: Colors.transparent,
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                iconSize: 51,
                onPressed: () {
                  Navigator.pushNamed(context, UPDATE_USER_LOCATION);
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
            const SizedBox(
              height: 8,
            ),
            DefaultFormField(
              hintText: '',
              textColor: darkBlue,
              height: 60,
              horizontalPadding: 32,
              controller: serviceNameController,
              validator: (text) {},
              keyboardType: TextInputType.text,
              backgroundColor: Colors.transparent,
              labelText: 'اسم الخدمه',
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
              hintText: '',
              textColor: darkBlue,
              height: 60,
              horizontalPadding: 32,
              controller: categoryController,
              validator: (text) {},
              keyboardType: TextInputType.text,
              backgroundColor: Colors.transparent,
              labelText: 'القسم',
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
                        SvgPicture.asset('assets/icons/incentive-svgrepo.svg',color: backgroundBlack,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: DefaultText(
                            text: '41',
                            textStyle: Theme.of(context).textTheme.bodyText1,
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
                            textStyle: Theme.of(context).textTheme.bodyText1,
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
                        SvgPicture.asset('assets/icons/coin.svg',color: backgroundBlack,height: 24,width: 24,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: DefaultText(
                            text: '12000.00',
                            textStyle: Theme.of(context).textTheme.bodyText1,
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
            Padding(padding:const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
            child: DefaultMaterialButton(text: 'حفظ التغييرات', onPressed: (){},),
            )
          ],
        ),
      ),
    );
  }
}
