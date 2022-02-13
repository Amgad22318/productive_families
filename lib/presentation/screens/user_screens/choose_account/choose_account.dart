import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';

class ChooseAccount extends StatelessWidget {
  const ChooseAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/image/welcome_background.png',

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 90,
                ),
                const SizedBox(
                  height: 80,
                ),
                DefaultMaterialButton(onPressed: (){
                  Navigator.pushNamed(context, START_SCREEN);
                },text: 'عميل',),
                const SizedBox(
                  height: 20,
                ),
                DefaultMaterialButton(onPressed: (){
                  Navigator.pushNamed(context, MARKET_OWNER_START_SCREEN);
                },text: 'صاحب عمل',),
                const SizedBox(
                  height: 20,
                ),
                DefaultMaterialButton(onPressed: (){
                  Navigator.pushNamed(context, DELIVERY_REPRESENTATIVE_START_SCREEN);
                },text: 'مندوب',),
              ],
            ),
          )
        ],
      ),
    );
  }
}
