import 'package:flutter/material.dart';

import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderDetailsItem extends StatelessWidget {
  final Color color;

  OrderDetailsItem({required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: size.height * 0.17,
                    decoration:const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/image/meal.png',
                            ),
                            fit: BoxFit.cover)),

                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        text: "اسم المنتج",
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        // textStyle: TextStyle(),
                      ),
                      const DefaultText(
                        text: "\$2121",
                        textStyle: TextStyle(),
                        color: defaultYellow,
                      ),
                      const DefaultText(
                        text:
                            "تطبيق للربط بين الاسر المنتجه ومساعدتهم على توفير بيئه",
                        textStyle: TextStyle(fontSize: 12), maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
