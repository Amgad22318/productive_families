import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerOtpScreen extends StatefulWidget {
  const MarketOwnerOtpScreen({Key? key}) : super(key: key);

  @override
  _MarketOwnerOtpScreenState createState() => _MarketOwnerOtpScreenState();
}

class _MarketOwnerOtpScreenState extends State<MarketOwnerOtpScreen> {
  bool msgSuccess = true;

  @override
  Widget build(BuildContext context) {
    _onSuccess() {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            contentPadding: const EdgeInsets.all(40),
            title: const Center(
                child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.check,
                color: backGroundWhite,
                size: 40,
              ),
            )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text(
                  '! التحقق',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'تم التحقق بنجاح وتم تفعيل الحساب الخاص بك',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: DefaultMaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'إبدأ',
                ),
              ),
            ],
          );
        },
      );
    }

    _onFailure() {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            contentPadding: const EdgeInsets.all(40),
            title: const Center(
                child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
              child: Icon(
                Icons.clear,
                color: backGroundWhite,
                size: 40,
              ),
            )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text(
                  '! التحقق',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'لم يتم التحقق بنجاح',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: DefaultMaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, '/shop_layout');
                  },
                  text: 'إبدأ',
                ),
              ),
            ],
          );
        },
      );
    }

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
                    const SizedBox(
                      height: 5,
                    ),
                    DefaultText(
                      color: greyText,
                      text:
                          'برجاء إدخال كود التحقق الذى تم ارساله الى رقم هاتفك الذى قمت بادخاله',
                      textStyle: Theme.of(context).textTheme.caption,
                      maxLines: 2,
                    ),
                    Column(
                      children: [
                        OtpTextField(
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
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {},
                          child: DefaultText(
                            text: 'إعادة إرسال الكود؟',
                            color: defaultYellow,
                            textStyle: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: DefaultMaterialButton(
                            onPressed: () {
                              msgSuccess ? _onSuccess() : _onFailure();
                            },
                            text: 'تسجيل الدخول',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'تعديل رقم الهاتف',
                            style: TextStyle(
                                color: defaultYellow,
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textDirection: TextDirection.rtl,
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