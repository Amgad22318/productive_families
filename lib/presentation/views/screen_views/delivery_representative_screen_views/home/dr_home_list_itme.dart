import 'package:flutter/material.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DeliveryRepresentativeHomeItem extends StatelessWidget {

  const DeliveryRepresentativeHomeItem({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,),
      child: SizedBox(
        height: 190,
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
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'assets/image/meal.png',
                    fit: BoxFit.cover,
                    height: 175,

                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 4,end: 10,top: 8,bottom: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Align(
                           alignment: AlignmentDirectional.topEnd,
                           child: DefaultText(
                            textAlign: TextAlign.end,
                            text: " منذ دقيقة منذ دقيقة",
                            textStyle: Theme.of(context).textTheme.overline!.copyWith(fontSize: 8),
                            // textStyle: TextStyle(),
                        ),
                         ),
                        Expanded(
                          child: DefaultText(
                            text: "اسم العميل",
                            textStyle: Theme.of(context).textTheme.bodyText2,
                            // textStyle: TextStyle(),
                          ),
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
      ),
    );
  }
}
