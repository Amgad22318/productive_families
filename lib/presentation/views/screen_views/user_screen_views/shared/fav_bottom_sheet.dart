import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_search_bar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../filtering/filtering_grid_fav_dialog_item.dart';

class FavBottomSheet extends StatefulWidget {
  const FavBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<FavBottomSheet> createState() =>
      _FavBottomSheetState();
}

class _FavBottomSheetState
    extends State<FavBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _newGroupController = TextEditingController();

  late bool listVisible;

  @override
  void initState() {
    listVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefaultText(
              text: listVisible ? 'إختر مجموعة' : 'إضافة مجموعة',
              textStyle: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Visibility(
              visible: listVisible,
              child: DefaultSearchBar(
                  border: Border.all(width: 1, color: Colors.grey),
                  textColor: darkBlue,
                  backgroundColor: Colors.transparent,
                  controller: _searchController,
                  keyboardType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Visibility(
                    visible: listVisible,
                    child: DefaultText(
                      text: 'مجموعاتك',
                      textStyle: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  const Spacer(),
                  DefaultIconButton(
                      background: darkBlue,
                      onPressed: () {
                        setState(() {
                          listVisible = !listVisible;
                        });
                      },
                      icon: const Icon(
                        Icons.playlist_add_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            Visibility(
              visible: listVisible,
              child: SizedBox(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: ListView(
                    children: List.generate(
                      13,
                      (index) => FilteringFavBottomSheetGroupItem(),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: !listVisible,
              child: LimitedBox(
                maxHeight: 180,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DefaultText(
                          text: 'اسم المجموعة',
                          textStyle: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.start,
                        ),
                        DefaultFormField(
                          maxLength: 20,
                          maxLines: 1,
                          textColor: darkBlue,
                            cursorColor: darkBlue,
                            backgroundColor: formFieldBackGroundGrey,
                            controller: _newGroupController,
                            validator: (text) {},
                            keyboardType: TextInputType.text),
                        DefaultMaterialButton(
                          text: 'إضافة',
                          onPressed: () {
                            setState(() {
                              listVisible = !listVisible;
                            });
                          },
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
