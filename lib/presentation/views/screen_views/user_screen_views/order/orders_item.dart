import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrdersItem extends StatelessWidget {
  final Color color;

  OrdersItem({required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: defaultYellow, width: 1.0)),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ORDER_DETAILS_SECOND_SCREEN);
          },
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/image/meal.png',
                  fit: BoxFit.cover,
                  height: 175,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DefaultText(
                              text: "اسم المتجر",
                              textStyle: Theme.of(context).textTheme.bodyText2,
                              // textStyle: TextStyle(),
                            ),
                          ),
                          Flexible(
                            flex: 0,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: color,
                                  radius: 5,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                if (color == backGroundRed) ...[
                                  DefaultText(
                                    text: 'قيد الانتظار',
                                    color: color,
                                    textStyle: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ] else if (color == backGroundAccentYellow) ...[
                                  DefaultText(
                                    text: 'قيد التحضير',
                                    color: color,
                                    textStyle: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ] else ...[
                                  DefaultText(
                                    text: 'قيد التوصيل',
                                    color: color,
                                    textStyle: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DefaultText(
                                  text: 'السعر الكلى',
                                  textStyle:
                                      Theme.of(context).textTheme.caption,
                                ),
                                DefaultText(
                                  text: "\$2121",
                                  textStyle:
                                      Theme.of(context).textTheme.caption,
                                  color: defaultYellow,
                                ),
                              ],
                            ),
                          ),
                          if (color == backGroundRed) ...[
                            Flexible(
                              flex: 1,
                              child: DefaultOutlinedButton(
                                fontSize: 12,
                                height: 32,
                                onPressed: () {},
                                text: 'إلغاء',
                              ),
                            ),
                          ]
                        ],
                      ),
                      DefaultText(
                        text:
                            "تطبيق للربط بين الاسر المنتجه   للربط بين الاسر المنتجه ومساعدتهم على توفير بيئه",
                        textStyle: Theme.of(context).textTheme.caption,
                        color: greyText,
                        maxLines: 3,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
