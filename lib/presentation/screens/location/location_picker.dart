import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';

class GuestLocationPicker extends StatelessWidget {
  GuestLocationPicker({Key? key}) : super(key: key);
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultShopAppbar(
        height: 80,
        centerTitle: true,
        title:
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children:  [
                        SvgPicture.asset(
                          "assets/icons/shop.svg",
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'المتاجر',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children:  [
                        SvgPicture.asset(
                          "assets/icons/patch-question-fll.svg",
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'استفسارات',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: Stack(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.white30,
              // map location
              child: const  Image(
                image: AssetImage('assets/image/map.png'),
                fit: BoxFit.fill,
              ),
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
                            'أدخل موقعك الحالى',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          // DefaultMaterialButton(text: 'text', onPressed: () {}),
                          DefaultFormField(
                            hintText: '',
                            prefixIcon:  const Icon(Icons.location_on_outlined),
                              controller: locationController,
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
