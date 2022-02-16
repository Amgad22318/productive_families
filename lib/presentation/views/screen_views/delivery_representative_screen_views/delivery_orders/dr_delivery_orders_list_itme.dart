import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeDeliveryOrdersListItem extends StatelessWidget {
  final bool orderAccepted;

  const DeliveryRepresentativeDeliveryOrdersListItem(
      {Key? key, this.orderAccepted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.textScaleFactorOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: LimitedBox(
        maxHeight: 240 * textScale,
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
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/image/make_up.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Flexible(
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
                            color: orderAccepted?Colors.green:darkBlue,
                            text: orderAccepted?'تم قبول الطلب':'منذ دقيقة منذ دقيقة',
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
                          'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة.',
                          textStyle: Theme.of(context).textTheme.overline,
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
                              text: "من",
                              textStyle: Theme.of(context).textTheme.caption,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(start: 20.0),
                          child: DefaultText(
                            text:
                                'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة.',
                            textStyle: Theme.of(context).textTheme.overline,
                            maxLines: 1,
                            color: greyText,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/location.svg',
                              height: 20,
                              width: 20,
                            ),
                            DefaultText(
                              text: "إلى",
                              textStyle: Theme.of(context).textTheme.caption,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.only(start: 20.0),
                          child: DefaultText(
                            text:
                                'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة.',
                            textStyle: Theme.of(context).textTheme.overline,
                            maxLines: 1,
                            color: greyText,
                          ),
                        ),
                      DefaultMaterialButton(
                        textScaleFactor: 1,
                        textColor: Colors.white,
                        background: darkBlue,
                        height: 40 * textScale,
                        text: orderAccepted?'إكمال الطلب':'14050.00',
                        fontSize: 12,
                        onPressed: () {},
                      ),
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
