import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';

class LocationPicker extends StatelessWidget {
  LocationPicker({Key? key}) : super(key: key);
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xFFFFDC2A),
                Color(0xFFFFF2B3),
              ],
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    Icon(Icons.storefront_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'المتاجر',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: const [
                    Icon(Icons.assignment_late),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'استفسارات',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: defaultYellow,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Center(
              child: Image(
                  image: AssetImage('assets/image/appbar_half_circle.png'))),
          // SizedBox(
          //   height: 150,
          // ),
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
                      Container(
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            color: formFieldBackGroundLightBlue,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextFormField(
                            controller: locationController,
                            decoration: const InputDecoration(
                                icon: Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.add_location,
                              ),
                            )),
                          )),
                      const SizedBox(height: 15),
                      DefaultMaterialButton(
                        text: 'text',
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
    );
  }
}
