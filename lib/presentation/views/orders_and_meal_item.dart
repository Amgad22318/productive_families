import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrdersAndMealItem extends StatelessWidget {
  Widget iconButton = Container();
   OrdersAndMealItem({required this.iconButton,Key? key}) : super(key: key);

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
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: size.height * 0.17,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefaultText(
                          text: "اسم المنتج",
                          textStyle: Theme.of(context).textTheme.headline6,
                          // textStyle: TextStyle(),
                        ),
                       iconButton,
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const DefaultText(
                      text: "\$2121",
                      textStyle: TextStyle(),
                      color: defaultYellow,
                    ),
                    const DefaultText(
                      text:
                          "تطبيق للربط بين الاسر المنتجه ومساعدتهم على توفير بيئه",
                      // textStyle: Theme.of(context).textTheme.bodyText1
                      textStyle: TextStyle(fontSize: 12), maxLines: 2,
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
                       const DefaultText(
                          text: '(تقييم 30)',
                          textStyle: TextStyle(color: Colors.grey,fontSize: 12),
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
