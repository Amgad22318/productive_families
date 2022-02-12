import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class ChosenFavoriteItem extends StatelessWidget {
  const ChosenFavoriteItem({Key? key}) : super(key: key);

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
                        'assets/image/meal.png',
                      ),
                      fit: BoxFit.fill)),
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
                            text: "اسم المنتج",
                            textStyle: Theme.of(context).textTheme.bodyText1,
                            // textStyle: TextStyle(),
                          ),
                        ),
                        Flexible(
                          flex: 0,
                          child: DefaultIconButton(
                              width: 36,
                              height: 36,
                              background: darkBlue,
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: lightDefaultYellow,
                                size: 18,
                              )),
                        ),
                      ],
                    ),
                    const DefaultText(
                      text: "\$2121",
                      textStyle: TextStyle(),
                      color: defaultYellow,
                    ),
                    DefaultText(
                      color: greyText,
                      text:
                          "تطبيق للربط بين الاسر المنتجه ومساعدتهم  على توفير على توفير بيئه",
                      textStyle: Theme.of(context).textTheme.caption,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 2.6,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 15.0,
                          direction: Axis.horizontal,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                         DefaultText(
                           color: greyText,
                          text: '(تقييم 3550)',
                          textStyle: Theme.of(context).textTheme.overline,

                        ),
                      ],
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
