import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class MarketOwnerFilteringGridFavDialogItem extends StatelessWidget {
  MarketOwnerFilteringGridFavDialogItem({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Flexible(
              flex: 0,
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: defaultYellow, width: 1.5),
                        borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Expanded(
                              child: Image.asset(
                            'assets/image/make_up.png',
                            fit: BoxFit.cover,
                            height: double.infinity,
                          )),
                          Container(
                            color: defaultYellow,
                            width: 1.5,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                    child: Image.asset(
                                  'assets/image/meal.png',
                                  fit: BoxFit.cover,
                                )),
                                Container(
                                  color: defaultYellow,
                                  height: 1.5,
                                ),
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
                ],
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: DefaultText(
                text: 'إسم المجموعة',
                textStyle: Theme.of(context).textTheme.caption,
              ),
            ),
          ),
          Flexible(
            flex: 0,
            child: DefaultIconButton(
              background: darkBlue,
              height: 30,
              width: 30,
              radius: 24,
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
