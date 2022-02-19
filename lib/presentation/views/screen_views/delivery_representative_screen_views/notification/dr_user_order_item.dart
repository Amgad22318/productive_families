import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class DisplayRepresentativeUserOrderItem extends StatelessWidget {
  const DisplayRepresentativeUserOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Material(
        color: lightDefaultYellow,
        child: InkWell(
          onTap: () {
            //Navigator.pushNamedAndRemoveUntil(context, QUOTATIONS_SCREEN, (route) => false);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                        // child: Text('logo'),
                        )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                          maxLines: 1,
                          text: 'طلب جديد',
                          textStyle: Theme.of(context).textTheme.bodyText1),
                      DefaultText(
                        maxLines: 1,
                        text: 'اسم العميل',
                        textStyle: Theme.of(context).textTheme.bodyText1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 10,
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: DefaultText(
                                  color: backGroundRed,
                                  maxLines: 1,
                                  text: 'سعر الطلب',
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontWeight: FontWeight.bold,)),
                            ),
                          ),
                          Flexible(
                              flex: 5,
                              child: DefaultMaterialButton(
                                textScaleFactor: 1,
                                textColor: Colors.white,
                                background: darkBlue,
                                height: 26,
                                text: 'قبول',
                                fontSize: 12,
                                onPressed: () {},
                              )),
                          const Spacer(
                            flex: 1,
                          ),
                          Flexible(
                              flex: 5,
                              child: DefaultOutlinedButton(
                                textScaleFactor: 1,
                                fontSize: 12,
                                borderColor: darkBlue,
                                height: 26,
                                text: 'إلغاء',
                                onPressed: () {},
                              ))
                        ],
                      ),
                    ],
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
