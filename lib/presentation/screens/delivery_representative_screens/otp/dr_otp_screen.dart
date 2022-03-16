import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
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
  bool msgSuccess = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    DefaultText(
                      color: Colors.white38,
                      text:
                          'برجاء إدخال كود التحقق الذى تم ارساله الى رقم هاتفك الذى قمت بادخاله',
                      textStyle: Theme.of(context).textTheme.caption,
                      maxLines: 2,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: OtpTextField(
                              focusedBorderColor: defaultYellow,
                              cursorColor: defaultYellow,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                              fieldWidth: 50.0,
                              fillColor: backGroundWhite,
                              numberOfFields: 4,
                              borderColor: backGroundWhite,
                              showFieldAsBox: true,
                              onCodeChanged: (String code) {},
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DefaultTextButton(
                            text: 'إعادة إرسال الكود؟',
                            textColor: defaultYellow,
                            textDecoration: TextDecoration.none,
                            textStyle:
                            Theme.of(context).textTheme.button,
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: DefaultMaterialButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => msgSuccess
                                      ? const OTPDialogSuccess(route: DELIVERY_REPRESENTATIVE_LOCATION_PICKER_SCREEN,message: 'sss',)
                                      : const OTPDialogFailure(message: 'ssss',));
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
