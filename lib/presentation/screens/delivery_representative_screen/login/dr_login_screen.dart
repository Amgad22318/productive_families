import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeLoginScreen extends StatelessWidget {
  DeliveryRepresentativeLoginScreen({Key? key}) : super(key: key);

  final TextEditingController nameOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/image/login_background.png"),
                      fit: BoxFit.fill,
                      alignment: Alignment.center)),
            ),
            Form(
              key: loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DefaultText(
                              text: 'رجوع',
                              textStyle: Theme.of(context).textTheme.headline6,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              padding: EdgeInsetsDirectional.zero,
                              icon: SvgPicture.asset(
                                  'assets/icons/back_arrow.svg'),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: DefaultText(
                            text: 'تسجيل الدخول',
                            textStyle: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(start: 16.0),
                          child: DefaultIconButton(
                            height: 50,
                            width: 50,
                            background: aboutGrey,
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/icons/info.svg',
                              height: 25,
                              width: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DefaultText(
                          text: 'الإسم او رقم الهاتف',
                          color: Colors.white,
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        DefaultFormField(
                            controller: nameOrPhoneController,
                            validator: (text) {},
                            keyboardType: TextInputType.text),
                        DefaultText(
                          text: 'كلمة المرور',
                          color: Colors.white,
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        DefaultFormField(
                            controller: passwordController,
                            validator: (text) {},
                            keyboardType: TextInputType.text),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultMaterialButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                GUEST_LOCATION_PICKER, (route) => false);
                          },
                          text: 'تسجيل الدخول',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
