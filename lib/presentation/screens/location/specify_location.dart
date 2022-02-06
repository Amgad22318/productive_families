import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class SpecifyLocation extends StatelessWidget {
  SpecifyLocation({Key? key}) : super(key: key);
  TextEditingController SpecifyLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        actions: [
          GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  color: Colors.black,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              })
        ],
        title: const DefaultText(
          text: 'تحديد العنوان',
          textStyle: TextStyle(),
        ),
      ),
      body: Stack(
        children: [
          Expanded(
            child: Container(
              color: Colors.white30,
              child: const Center(child: Text('map')),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [

              const Center(
                  child: Image(
                      image: AssetImage('assets/image/appbar_half_circle.png'))),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                  color: darkBlue,
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ادخل موقعك الحالى',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          // DefaultMaterialButton(text: 'text', onPressed: () {}),
                          DefaultFormField(
                              hintText: '',
                              prefixIcon: Icons.location_on_outlined,
                              controller: SpecifyLocationController,
                              validator: (p0) {},
                              keyboardType: TextInputType.text),
                          const SizedBox(height: 15),
                          DefaultMaterialButton(
                            text: 'تأكيد العنوان',
                            onPressed: () {},
                            height: size.height * 0.06,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
