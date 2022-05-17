import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/shared/otp_screen/otp_dialog_failure.dart';
import 'package:productive_families/presentation/views/screen_views/shared/otp_screen/otp_dialog_success.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../business_logic/user/auth/user_auth_cubit.dart';
import '../../../../constants/enums.dart';
import '../../../widgets/default_text_button.dart';

class UserOtpScreen extends StatefulWidget {
  final String phone;

  const UserOtpScreen({Key? key,required this.phone}) : super(key: key);

  @override
  _UserOtpScreenState createState() => _UserOtpScreenState();
}

class _UserOtpScreenState extends State<UserOtpScreen> {
  UserAuthCubit? cubit;
  final codeController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    codeController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final defaultPinTheme = const PinTheme(
    width: 60,
    height: 60,
    decoration: BoxDecoration(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserAuthCubit(),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
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
            reverse: true,
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
                                        message: state.message!,
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pushReplacementNamed(
                                              context, USER_LOGIN_SCREEN);
                                        },
                                      ));
                            } else if (state
                                is UserRegisterConfirmPhoneErrorState) {
                              showDialog(
                                  context: context,
                                  builder: (context) => OTPDialogFailure(
                                        message: state.message ??
                                            'برجاء المحاولة مرة اخرى',
                                      ));
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsetsDirectional.all(16),
                                  width: 240,
                                  height: 60,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Pinput(
                                      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                                      length: 4,
                                      controller: codeController,
                                      focusNode: focusNode,
                                      separator: Container(
                                        height: 60,
                                        width: 1,
                                        color: darkBlue,
                                      ),
                                      defaultPinTheme: defaultPinTheme,
                                      focusedPinTheme: defaultPinTheme.copyWith(
                                        decoration: const BoxDecoration(
                                            color: defaultYellow),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
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
                                          phone: widget.phone);
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: DefaultMaterialButton(
                                    onPressed: () {
                                      String value = codeController.text;
                                      if (value.isEmpty || value.length != 4) {
                                        showToastMsg(
                                            msg: 'برجاء ادخال الكود',
                                            toastState: ToastStates.WARNING);
                                      } else if (value.length == 4) {
                                        cubit?.userRegisterConfirmPhone(
                                            phone: widget.phone,
                                            code: codeController.text);
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
