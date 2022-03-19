import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/shared/otp_screen/otp_dialog_failure.dart';
import 'package:productive_families/presentation/views/screen_views/shared/otp_screen/otp_dialog_success.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/default_text_button.dart';

import '../../../../constants/end_points.dart';

class DeliveryRepresentativeOtpScreen extends StatefulWidget {
  const DeliveryRepresentativeOtpScreen({Key? key}) : super(key: key);

  @override
  _DeliveryRepresentativeOtpScreenState createState() =>
      _DeliveryRepresentativeOtpScreenState();
}

class _DeliveryRepresentativeOtpScreenState
    extends State<DeliveryRepresentativeOtpScreen> {

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

  bool msgSuccess = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    DefaultText(
                      color: Colors.white38,
                      text:
                          'برجاء إدخال كود التحقق الذى تم ارساله الى رقم هاتفك الذى قمت بادخاله',
                      textStyle: Theme.of(context).textTheme.caption,
                      maxLines: 2,
                    ),
                    Column(
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
                            textStyle: Theme.of(context).textTheme.button,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: DefaultMaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => msgSuccess
                                      ? OTPDialogSuccess(
                                          onPressed: () {
                                            Navigator.pushReplacementNamed(
                                                context,
                                                DELIVERY_REPRESENTATIVE_LOGIN_SCREEN);
                                          },
                                          message: 'sss',
                                        )
                                      : const OTPDialogFailure(
                                          message: 'ssss',
                                        ));
                            },
                            text: 'تسجيل الدخول',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
