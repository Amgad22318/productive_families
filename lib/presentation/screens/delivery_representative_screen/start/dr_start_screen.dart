import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text_button.dart';

class DeliveryRepresentativeStartScreen extends StatelessWidget {
  const DeliveryRepresentativeStartScreen({Key? key}) : super(key: key);

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
                      alignment: Alignment.center),
                )),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
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
                  Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                        color: darkBlue,

                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(175),
                            topRight: Radius.circular(175))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 90,
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                          ),
                          child: DefaultMaterialButton(
                            width: 180,
                            text: 'تسجيل الدخول',
                            onPressed: () {
                              Navigator.pushNamed(context, DELIVERY_REPRESENTATIVE_LOGIN_SCREEN);
                            },
                          ),
                        ),
                        DefaultTextButton(
                          text: 'إنشاء حساب جديد',
                          textStyle:
                          Theme.of(context).textTheme.button,
                          onPressed: () {
                            Navigator.pushNamed(context, DELIVERY_REPRESENTATIVE_REGISTER_SCREEN);

                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
