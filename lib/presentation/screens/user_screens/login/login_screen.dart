import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

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
                      Column(
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
                              SizedBox(
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  padding: EdgeInsetsDirectional.zero,
                                  icon: const Icon(Icons.arrow_forward_ios),
                                ),
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
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: aboutGrey,
                            ),
                            child: IconButton(
                              padding: const EdgeInsetsDirectional.all(20),
                              icon: Image.asset('assets/icons/info.svg'),
                              onPressed: () {},
                            ),
                          ),
                        ],
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
                              textStyle:
                              Theme.of(context).textTheme.headline6,
                            ),
                            DefaultFormField(
                                controller: nameOrPhoneController,
                                validator: (text) {

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


                                },
                                keyboardType: TextInputType.text),
                            const SizedBox(
                              height: 30,
                            ),
                            DefaultMaterialButton(
                              onPressed: () {

                                Navigator.pushNamedAndRemoveUntil(context, GUEST_LOCATION_PICKER, (route) => false);

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
