import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeOrderDetailsListItem
    extends StatelessWidget {
  const DeliveryRepresentativeOrderDetailsListItem({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.textScaleFactorOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      child: LimitedBox(
        maxHeight: 160 * textScale,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(color: defaultYellow, width: 1.0)),
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/image/meal.png',
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
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: DefaultText(
                              text: "اسم العميل",
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              // textStyle: TextStyle(),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: DefaultText(
                              text: "\$279321.96",
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  DELIVERY_REPRESENTATIVE_CHOOSE_ORDER_LOCATION);
                            },
                            iconSize: 20,
                            padding: EdgeInsets.all(4),
                            constraints: BoxConstraints(),
                            icon: SvgPicture.asset(
                              'assets/icons/location.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          DefaultText(
                            text: "من",
                            textStyle: Theme.of(context).textTheme.caption,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 24.0),
                        child: DefaultText(
                          text:
                              'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة.',
                          textStyle: Theme.of(context).textTheme.overline,
                          maxLines: 1,
                          color: greyText,
                        ),
                      ),
                      DefaultText(
                        text: "اسم المتجر",
                        textStyle: Theme.of(context).textTheme.bodyText1,
                        // textStyle: TextStyle(),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context,
                                  DELIVERY_REPRESENTATIVE_CHOOSE_ORDER_LOCATION);
                            },
                            iconSize: 20,
                            padding: EdgeInsets.all(4),
                            constraints: BoxConstraints(),
                            icon: SvgPicture.asset(
                              'assets/icons/location.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          DefaultText(
                            text: "إلى",
                            textStyle: Theme.of(context).textTheme.caption,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 24.0),
                        child: DefaultText(
                          text:
                              'تطبيق للربط بين الاسر المنتجة وعلائهم على أن يوفر بيئة.',
                          textStyle: Theme.of(context).textTheme.overline,
                          maxLines: 1,
                          color: greyText,
                        ),
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
