import 'package:flutter/material.dart';

import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_outlined_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrdersItem extends StatelessWidget {
 final Color color;
  OrdersItem({required this.color,Key? key}) : super(key: key);

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
              child: Container(
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
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              width: 10
            ),
            Expanded(
              child: Container(
                height: size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultText(
                              text: "اسم المتجر",
                              textStyle: Theme.of(context).textTheme.bodyText1,
                              // textStyle: TextStyle(),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: color,
                                    radius: 5,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                 if(color == backGroundRed)...[ DefaultText(
                                   text: 'قيد الانتظار',color: color,
                                   textStyle: const TextStyle(
                                     fontSize: 10, ),
                                 ),]else if(color == backGroundAccentYellow)...[
                                   DefaultText(
                                     text: 'قيد التحضير',color: color,
                                     textStyle: const TextStyle(
                                       fontSize: 10, ),
                                   ),
                                 ]else...[
                                   DefaultText(
                                     text: 'قيد التوصيل',color: color,
                                     textStyle: const TextStyle(
                                       fontSize: 10, ),
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
                                textStyle: Theme.of(context).textTheme.bodyText2,
                              ),
                              const DefaultText(
                                text: "\$2121",
                                textStyle: TextStyle(),
                                color: defaultYellow,
                              ),
                            ],
                          ),
                        ),
                         if( color == backGroundRed  )...[ SizedBox(
                             height: size.height*0.04,
                             width: size.width*0.2,
                             child: DefaultOutlinedButton(onPressed: (){},text: 'إلغاء',)),
                           SizedBox(width: size.width*0.02,),]

                      ],
                    ),
                    Expanded(
                      child: DefaultText(
                        text:
                            "تطبيق للربط بين الاسر المنتجه ومساعدتهم على توفير بيئه",
                        textStyle: Theme.of(context).textTheme.caption, maxLines: 5,
                      ),
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
