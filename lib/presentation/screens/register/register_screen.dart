import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/screens/message/otp_screen.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({Key? key}) : super(key: key);
  TextEditingController nameOrPhoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  padding: EdgeInsetsDirectional.zero,
                                  icon: const Icon(Icons.arrow_back_ios),
                                ),
                              ),
                              DefaultText(
                                text: 'رجوع',
                                textStyle:
                                Theme.of(context).textTheme.headline6,
                              )
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: DefaultText(
                              text: 'تسجيل الدخول',
                              textStyle:
                              Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: aboutGrey,
                            ),
                            child: IconButton(
                              padding: const EdgeInsetsDirectional.all(20),
                              icon: Image.asset('assets/icons/info.png'),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),

                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DefaultText(
                              text: 'الإسم او رقم الهاتف',
                              color: Colors.white,
                              textStyle:
                              Theme.of(context).textTheme.headline6,
                            ),
                            DefaultFormField(
                                controller: nameOrPhoneController,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'ادخل الإسم او رقم الهاتف';
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
                            const SizedBox(
                              height: 30,
                            ),
                            DefaultMaterialButton(
                              onPressed: () {
                                if (loginFormKey.currentState!.validate()) {}
                                Navigator.pushNamed(context,OTP_SCREEN);
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
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
