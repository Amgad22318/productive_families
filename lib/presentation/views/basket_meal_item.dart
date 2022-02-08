//        implementing

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class BasketMealItem extends StatelessWidget {
  BasketMealItem({Key? key}) : super(key: key);

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
            Container(
              height: size.height * 0.2,
              width: size.width * 0.4,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/image/selected_favorite.png',
                      ),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: size.height * 0.17,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: DefaultText(
                            text: "اسم المتجر",
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            // textStyle: TextStyle(),
                          ),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: orderFormFieldBackGroundGrey),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: (){},
                                    child: Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                          color: darkBlue,
                                          borderRadius: BorderRadius.circular(40)
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: backGroundWhite,
                                        size: 16,
                                      ),
                                    ),

                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Container(
                                    child: const Center(
                                      child: Text('2'),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Container(
                                      height: 24,
                                      width: 24,

                                      decoration: BoxDecoration(
                                        color: darkBlue,
                                        borderRadius: BorderRadius.circular(40)
                                      ),
                                      child: const Icon(
                                        Icons.remove,
                                        color: backGroundWhite,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              child: SvgPicture.asset(
                                "assets/icons/delete.svg",
                                color: const Color(0xFFFF0000),
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const DefaultText(
                      text: "\$2121",
                      textStyle: TextStyle(),
                      color: defaultYellow,
                    ),
                    const DefaultText(
                      text:
                          "تطبيق للربط بين الاسر المنتجه ومساعدتهم على توفير بيئه",
                      textStyle: TextStyle(fontSize: 12),
                      maxLines: 2,
                      color: formFieldBackGroundLightBlue,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
