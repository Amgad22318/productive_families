import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late bool isChecked;

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

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
                        text: 'تسجيل حساب جديد',
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
                                  controller: passwordController,
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
                                    'سوف يتم ارسال رسالة نصية لك لتأكيد رقمك',
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
                                    text: 'موافق على',
                                    color: defaultYellow,
                                    textStyle:
                                    Theme.of(context).textTheme.caption,
                                  ),
                                  const Padding(
                                   padding:  EdgeInsetsDirectional.only(start: 5),
                                   child:  Text('الشروط والأحكام',
                                    style: TextStyle(
                                      color: defaultYellow,
                                      decoration: TextDecoration.underline,
                                      fontSize: 15
                                    ),
                                    ),
                                 )

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30.0),
                                child: DefaultMaterialButton(
                                  onPressed: () {
                                    if (true) {
                                      Navigator.pushNamed(context,
                                          OTP_SCREEN);
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
