import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/order/order_details_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:productive_families/presentation/widgets/default_text_button.dart';

class OrderDetailsSecondScreenItem extends StatelessWidget {
  final Color color;
  TextEditingController commentController = TextEditingController();

  OrderDetailsSecondScreenItem({required this.color, Key? key})
      : super(key: key);

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
                    decoration: const BoxDecoration(
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
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DefaultText(
                                text: "اسم المنتج",
                                textStyle:
                                    Theme.of(context).textTheme.bodyText1,
                                // textStyle: TextStyle(),
                              ),
                              DefaultTextButton(
                                text: 'قيم المنتج',
                                textStyle: Theme.of(context).textTheme.button,
                                onPressed: () {
                                  showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(32),
                                        topRight: Radius.circular(32),
                                      )),
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) =>
                                          OrderDetailsBottomSheet());
                                },
                                textColor: darkBlue,
                              )
                            ],
                          ),
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
                        ),
                      ],
                    ),
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
