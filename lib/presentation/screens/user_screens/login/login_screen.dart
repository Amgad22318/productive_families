import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/business_logic/user/login/user_login_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  UserLoginCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLoginCubit(),
      child: Scaffold(
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
                            icon:
                                SvgPicture.asset('assets/icons/back_arrow.svg'),
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
                          onPressed: () {
                            Navigator.pushNamed(context, ABOUT_US_SCREEN);
                          },
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
                            key: loginFormKey,
                            child:
                                BlocConsumer<UserLoginCubit, UserLoginStates>(
                              listener: (context, state) {
                                if(state is UserLoginErrorState){
                                  showToastMsg(msg: state.message, toastState: ToastStates.ERROR);
                                }
                                if(state is UserLoginSuccessState){
                                  Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      FIRST_TIME_LOCATION_PICKER,
                                          (route) => false);
                                }


                              },
                              builder: (context, state) {
                                cubit = UserLoginCubit.get(context);
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(
                                      height: 110,
                                    ),
                                    DefaultText(
                                      text: 'رقم الهاتف',
                                      color: Colors.white,
                                      textStyle:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    DefaultFormField(
                                        maxLength: 11,
                                        controller: phoneController,
                                        validator: (text) {
                                          if (text!.isEmpty) {
                                            return 'رقم الهاتف فارغ';
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
                                        maxLength: 9,
                                        controller: passwordController,
                                        validator: (text) {
                                          if (text!.isEmpty) {
                                            return 'كلمة المرور فارغة';
                                          }
                                        },
                                        keyboardType: TextInputType.text),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: DefaultMaterialButton(
                                        width: 180,
                                        onPressed: () {
                                          if (loginFormKey.currentState!
                                              .validate()) {
                                            cubit!.userLogin(
                                                phone: phoneController.text,
                                                password:
                                                    passwordController.text);
                                          }

                                        },
                                        text: 'تسجيل الدخول',
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                );
                              },
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
      ),
    );
  }
}
