import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeRegisterScreen extends StatefulWidget {
  const DeliveryRepresentativeRegisterScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryRepresentativeRegisterScreen> createState() =>
      _DeliveryRepresentativeRegisterScreenState();
}

class _DeliveryRepresentativeRegisterScreenState
    extends State<DeliveryRepresentativeRegisterScreen> {
  late bool isChecked;

 final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

 final  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image/login_background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
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
                          icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
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
                      padding: const EdgeInsetsDirectional.only(start: 16.0),
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
                    const Spacer(),
                    Material(
                      color: darkBlue,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(180),
                          topRight: Radius.circular(180)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Form(
                          key: registerFormKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              DefaultText(
                                text: 'الاسم الاول',
                                color: Colors.white,
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                              ),
                              DefaultFormField(
                                  controller: nameController,
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return 'ادخل الاسم الاول';
                                    }
                                  },
                                  keyboardType: TextInputType.text),
                              DefaultText(
                                text: 'رقم الهاتف',
                                color: Colors.white,
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                              ),
                              DefaultFormField(
                                  controller: phoneController,
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return 'ادخل رقم الهاتف';
                                    }
                                  },
                                  keyboardType: TextInputType.text),
                              DefaultText(
                                text: 'كلمة المرور',
                                color: Colors.white,
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                              ),
                              DefaultFormField(
                                  controller: passwordController,
                                  maxLines: 1,
                                  obscureText: true,
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return 'ادخل كلمة المرور';
                                    }
                                  },
                                  keyboardType: TextInputType.text),
                              DefaultText(
                                text: 'تاكيد كلمة المرور',
                                color: Colors.white,
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                              ),
                              DefaultFormField(
                                  controller: confirmPasswordController,
                                  maxLines: 1,
                                  obscureText: true,
                                  validator: (text) {
                                    if (text!.isEmpty) {
                                      return 'ادخل كلمة المرور';
                                    }
                                  },
                                  keyboardType: TextInputType.text),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Align(
                                  alignment: AlignmentDirectional.center,
                                  child: DefaultText(
                                    maxLines: 2,
                                    text:
                                        'سوف نتصل بك أو نرسل لك رسالة نصية لتأكيد رقمك',
                                    color: Colors.grey,
                                    textStyle:
                                        Theme.of(context).textTheme.overline,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    checkColor: darkBlue,
                                    fillColor: MaterialStateProperty
                                        .resolveWith((states) =>
                                            getColor(states, defaultYellow)),
                                    shape: const CircleBorder(),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                    value: isChecked,
                                  ),
                                  DefaultText(
                                    text: 'موافق على الشروط والأحكام',
                                    color: defaultYellow,
                                    textStyle:
                                        Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: DefaultMaterialButton(
                                  onPressed: () {
                                    if (true) {
                                      Navigator.pushNamed(context,
                                          DELIVERY_REPRESENTATIVE_OTP_SCREEN);
                                    }
                                  },
                                  text: 'تسجيل الدخول',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
