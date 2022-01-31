import 'package:flutter/material.dart';
import 'package:otp_text_field/style.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:otp_text_field/otp_text_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                  },
                  text: 'إبدأ',
                ),
              ),
            ],
          );
        },
      );
    }

    double screenHeight =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsetsDirectional.zero,
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    DefaultText(
                      color: Colors.white,
                      text: 'رجوع',
                      textStyle: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                Image.asset("assets/image/msg_background.png"),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        child: DefaultText(
                          color: aboutGrey,
                          text: 'تحقق تسجيل الدخول',
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        alignment: AlignmentDirectional.topEnd,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        child: DefaultText(
                          color: Colors.white38,
                          text: 'برجاء إدخال كود التحقق الذى تم ارساله الى',
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        alignment: AlignmentDirectional.topEnd,
                      ),
                      Align(
                        child: DefaultText(
                          color: Colors.white38,
                          text: 'رقم هاتفك الذى قمت بادخاله',
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                        alignment: AlignmentDirectional.topEnd,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: OTPTextField(
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: 80,
                          style: TextStyle(fontSize: 17),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          onCompleted: (pin) {
                            print("Completed: " + pin);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultText(
                        text: 'إعادة إرسال الكود؟',
                        color: defaultYellow,
                        textStyle: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: DefaultMaterialButton(
                          onPressed: () {
                            msgSuccess? _onSuccess():_onFailure();
                          },
                          text: 'تسجيل الدخول',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultText(
                        text: 'تعديل رقم الهاتف',
                        color: defaultYellow,
                        textStyle: Theme.of(context).textTheme.headline6,
                      ),
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
