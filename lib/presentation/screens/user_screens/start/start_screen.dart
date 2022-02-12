import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/start_background.png"),
                fit: BoxFit.fill,
                  alignment: Alignment.center
              ),
            )),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
                    Container(
                      alignment: AlignmentDirectional.center,
                      width: 188,
                      height: 188,
                      decoration: const BoxDecoration(
                        color: defaultYellow, // border color
                        shape: BoxShape.circle,
                      ),
                      child: const Text('logo'),
                    ),
                    const Spacer(),
                    DefaultMaterialButton(
                      text: 'تسجيل الدخول',
                      onPressed: () {
                        Navigator.pushNamed(context,LOGIN_SCREEN );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DefaultOutlinedButton(
                      onPressed: () {

                        Navigator.pushNamed(context,GUEST_LOCATION_PICKER );
                      },
                      text: 'الدخول كزائر',
                      textColor: defaultYellow,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DefaultTextButton(
                      text: 'إنشاء حساب جديد',
                      onPressed: () {
                        Navigator.pushNamed(context,REGISTER_SCREEN );
                      },
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
