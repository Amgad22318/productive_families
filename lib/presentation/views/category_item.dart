import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          width: 170,
          height: 170,
          decoration: BoxDecoration(
              border: Border.all(color:defaultYellow, width: 1.5),
              borderRadius: BorderRadius.circular(26)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),clipBehavior: Clip.antiAlias,
            child: Row(
              textDirection:TextDirection.rtl ,
              children: [
                Expanded(
                    child: Image.asset(
                      'assets/image/make_up.png',
                      fit: BoxFit.cover,
                      height: double.infinity,
                    )),
                Container(color: defaultYellow,width: 1.5,),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                          child: Image.asset(
                            'assets/image/meal.png',
                            fit: BoxFit.cover,
                          )),
                      Container(color: defaultYellow,height: 1.5,),
                      Expanded(
                          child: Image.asset(
                            'assets/image/user_photo.png',
                            fit: BoxFit.cover,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultText(text: 'طعام', textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18)),
        )
      ],
    );
  }
}
