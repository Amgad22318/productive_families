import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/DefaultSvg.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderDetailsBottomSheet extends StatelessWidget {
  OrderDetailsBottomSheet({Key? key}) : super(key: key);
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0))),
      child: Wrap(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: DefaultText(
                text: 'تقييم المنتج',
                textStyle: Theme.of(context).textTheme.headline6),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    '',
                    width: 140,
                    height: 100,
                    errorBuilder: (context, error, stackTrace) => Container(
                        decoration: const BoxDecoration(
                            color: grey2,
                            borderRadius: BorderRadius.all(Radius.circular(16))),
                        padding: const EdgeInsetsDirectional.all(38),
                        width: 140,
                        height: 100,
                        child: const DefaultSvg(
                          imagePath: 'assets/icons/add_picture.svg',
                        )),
                  ),
                ),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                DefaultText(
                    text: 'تعليقك',
                    textStyle: Theme.of(context).textTheme.bodyText1),
                const SizedBox(
                  height: 20,
                ),
                DefaultFormField(

                  height: 100,
                  controller: commentController,
                  keyboardType: TextInputType.multiline,
                  backgroundColor: orderFormFieldBackGroundGrey,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 50,
                ),
                DefaultMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'تقييم',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
