import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/shared/otp_screen/otp_dialog_failure.dart';
import 'package:productive_families/presentation/views/screen_views/shared/otp_screen/otp_dialog_success.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../business_logic/user/auth/user_auth_cubit.dart';
import '../../../widgets/default_text_button.dart';

class UserOtpScreen extends StatefulWidget {
  final String? phone;

  const UserOtpScreen({Key? key, this.phone}) : super(key: key);

  @override
  _UserOtpScreenState createState() => _UserOtpScreenState();
}

class _UserOtpScreenState extends State<UserOtpScreen> {
  bool msgSuccess = true;
  String code = '';
  UserAuthCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserAuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: darkBlue,
          actions: [
            Row(
              children: [
                DefaultText(
                  color: Colors.white,
                  text: 'رجوع',
                  textStyle: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsetsDirectional.zero,
                  icon: SvgPicture.asset(
                    "assets/icons/back_arrow.svg",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: darkBlue,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/image/msg_background.png"),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        color: aboutGrey,
                        text: 'تحقق تسجيل الدخول',
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      DefaultText(
                        color: Colors.white38,
                        text:
                            'برجاء إدخال كود التحقق الذى تم ارساله الى رقم هاتفك الذى قمت بادخاله',
                        textStyle: Theme.of(context).textTheme.caption,
                        maxLines: 2,
                      ),
                      Builder(builder: (context) {
                        cubit = UserAuthCubit.get(context);
                        return BlocConsumer<UserAuthCubit, UserAuthStates>(
                          listener: (context, state) {
                            if (state is UserRegisterConfirmPhoneSuccessState) {
                              showDialog(
                                  context: context,
                                  builder: (context) => OTPDialogSuccess(
                                        route: USER_LOGIN_SCREEN,
                                        message: state.message!,
                                      ));
                            } else if (state
                                is UserRegisterConfirmPhoneErrorState) {
                              showDialog(
                                  context: context,
                                  builder: (context) =>  OTPDialogFailure(message: state.message??'برجاء المحاولة مرة اخرى',));
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                OtpTextField(
                                  keyboardType: TextInputType.number,
                                  focusedBorderColor: defaultYellow,
                                  cursorColor: defaultYellow,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(color: Colors.white),

                                  fieldWidth: 50.0,
                                  fillColor: backGroundWhite,
                                  numberOfFields: 4,
                                  borderColor: backGroundWhite,
                                  //set to true to show as box or false to show as dash
                                  showFieldAsBox: true,
                                  onSubmit:(String code) {
                                    setState(() {
                                      this.code = code;
                                    });
                                  } ,
                                  //runs when a code is typed in

                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DefaultTextButton(
                                    text: 'إعادة إرسال الكود؟',
                                    textColor: defaultYellow,
                                    textDecoration: TextDecoration.none,
                                    textStyle:
                                        Theme.of(context).textTheme.button,
                                    onPressed: () {
                                      cubit?.userRegisterResendConfirmationCode(
                                          phone: widget.phone!);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: DefaultMaterialButton(
                                    onPressed: () {
                                      if (code.length == 4) {
                                        printTest(code);

                                        cubit?.userRegisterConfirmPhone(
                                            phone: widget.phone!, code: code);
                                      } else {
                                        printTest(code);
                                        showToastMsg(
                                            msg: 'ادخل كود التاكيد',
                                            toastState: ToastStates.WARNING);
                                      }
                                    },
                                    text: 'تسجيل الدخول',
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
