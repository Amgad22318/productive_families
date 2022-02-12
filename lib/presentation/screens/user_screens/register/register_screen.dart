import 'package:flutter/material.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
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
    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: registerFormKey,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/image/register_background.png"),
                fit: BoxFit.fill,
              )),
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
                            icon: Image.asset('assets/icons/info.png'),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight * 0.3,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DefaultText(
                          text: 'الاسم الاول',
                          color: Colors.white,
                          textStyle: Theme.of(context).textTheme.headline6,
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
                          textStyle: Theme.of(context).textTheme.headline6,
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
                          textStyle: Theme.of(context).textTheme.headline6,
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
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        DefaultFormField(
                            controller: passwordController,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'ادخل كلمة المرور';
                              }
                            },
                            keyboardType: TextInputType.text),
                        Align(
                          alignment: AlignmentDirectional.center,
                          child: DefaultText(
                            text:
                                'سوف نتصل بك أو نرسل لك رسالة نصية لتأكيد رقمك',
                            color: Colors.grey,
                            textStyle: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              checkColor: darkBlue,
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => getColor(states,defaultYellow)),
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
                              textStyle: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultMaterialButton(
                          onPressed: () {
                            if (true) {
                              Navigator.pushNamed(context, OTP_SCREEN);

                            }
                          },
                          text: 'تسجيل الدخول',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
