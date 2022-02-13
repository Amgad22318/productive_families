import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeHomeItem extends StatelessWidget {
  const DeliveryRepresentativeHomeItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: SizedBox(
        height: 210,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(color: defaultYellow, width: 1.0)),
          child: InkWell(
            onTap: () {
              //Navigator.pushNamed(context, ORDER_DETAILS_SECOND_SCREEN);
            },
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          'assets/image/meal.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 6, end: 6, top: 8, bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: DefaultText(
                            textAlign: TextAlign.end,
                            text: " منذ دقيقة منذ دقيقة",
                            textStyle: Theme.of(context)
                                .textTheme
                                .overline!
                                .copyWith(fontSize: 8),
                            // textStyle: TextStyle(),
                          ),
                        ),
                        DefaultText(
                          text: "اسم العميل",
                          textStyle: Theme.of(context).textTheme.bodyText2,
                          // textStyle: TextStyle(),
                        ),
                        DefaultText(
                          text:
                              'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة.',
                          textStyle: Theme.of(context).textTheme.caption,
                          maxLines: 2,
                          color: greyText,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/location.svg',
                              height: 20,
                              width: 20,
                            ),
                            DefaultText(
                              text: "العنوان بالتفصيل",
                              textStyle: Theme.of(context).textTheme.caption,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        DefaultText(
                          text:
                              'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة.',
                          textStyle: Theme.of(context).textTheme.overline,
                          maxLines: 1,
                          color: greyText,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 10,
                                child: DefaultMaterialButton(
                                  textColor: Colors.white,
                                  background: darkBlue,
                                  height: 40,
                                  text: 'قبول',
                                  onPressed: () {},
                                )),
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                                flex: 10,
                                child: DefaultOutlinedButton(
                                  borderColor: darkBlue,
                                  height: 40,
                                  text: 'رفض',
                                  onPressed: () {},
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
