import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/profile_bottom_sheet_item.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class OrderTrackingBottomSheet extends StatelessWidget {
  OrderTrackingBottomSheet({Key? key}) : super(key: key);
  TextEditingController FamilycommentController = TextEditingController();
  TextEditingController RepresentativecommentController = TextEditingController();

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
            child:Column(
              children: [ const Image(image: AssetImage('assets/image/order_done.png')),
              DefaultText(text: 'تم إنهاء الطلب بنجاح', textStyle: Theme.of(context).textTheme.caption,)
              ],
            )
          ),
          const SizedBox(
            height: 40,
          ), Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  child: DefaultText(
                      text: 'تقييم الأسره',
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline6),
                  alignment: Alignment.topCenter,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color:Colors.grey,
                ),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:
                  const EdgeInsets.symmetric(
                      horizontal: 4.0),
                  itemBuilder: (context, _) =>
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                DefaultText(
                    text: 'تعليقك',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText2),
                const SizedBox(
                  height: 10,
                ),
                DefaultFormField(
                  height: 80,
                  controller: FamilycommentController,
                  validator: (p0) {},
                  keyboardType: TextInputType.multiline,
                  backgroundColor: orderFormFieldBackGroundGrey,
                  maxLines: 5,
                ),
                const SizedBox(height: 16,),
                Align(
                  child: DefaultText(
                      text: 'تقييم المندوب',
                      textStyle: Theme.of(context)
                          .textTheme
                          .headline6),
                  alignment: Alignment.topCenter,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color:Colors.grey,
                ),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding:
                  const EdgeInsets.symmetric(
                      horizontal: 4.0),
                  itemBuilder: (context, _) =>
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                DefaultText(
                    text: 'تعليقك',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText2),
                const SizedBox(
                  height: 10,
                ),
                DefaultFormField(
                  height: 80,
                  controller: RepresentativecommentController,
                  validator: (p0) {},
                  keyboardType: TextInputType.multiline,
                  backgroundColor: orderFormFieldBackGroundGrey,
                  maxLines: 5,
                ),
                const SizedBox(height: 16,),
                DefaultMaterialButton(onPressed: (){},text: 'تقييم',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
