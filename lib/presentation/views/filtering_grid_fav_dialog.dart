import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/filtering_grid_fav_dialog_item.dart';
import 'package:productive_families/presentation/widgets/default_search_bar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class FilteringGridFavDialog extends StatelessWidget {
  FilteringGridFavDialog({Key? key}) : super(key: key);
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      contentPadding: const EdgeInsets.all(16),
      title: DefaultText(
        text: 'إختر مجموعة',
        textStyle: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DefaultSearchBar(
              textColor: darkBlue,
              backgroundColor: Colors.transparent,
              controller: _searchController,
              validator: (text) {},
              keyboardType: TextInputType.text),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                DefaultText(
                  text: 'مجموعاتك',
                  textStyle: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 200,
                  child: ListView(
                    children: List.generate(
                      13,
                      (index) => FilteringGridFavDialogItem(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
