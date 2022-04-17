import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_families/data/models/user_models/category/user_all_categories_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../../business_logic/user/stores/all_and_single_category_stores_cubit.dart';
import '../../../../../constants/constant_methods.dart';

class MarketSectionItem extends StatefulWidget {
  final int? index;
  bool itemHidden;
  final Categories category;
  final AllAndSingleCategoryStoresCubit categoryStoresCubit;



  MarketSectionItem({
    Key? key,
    required this.index,
    this.itemHidden = true,
    required this.category, required this.categoryStoresCubit,
  }) : super(key: key);

  @override
  State<MarketSectionItem> createState() => _MarketSectionItemState();
}

class _MarketSectionItemState extends State<MarketSectionItem> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
      child: BlocBuilder<AllAndSingleCategoryStoresCubit,
          AllAndSingleCategoryStoresStates>(
        builder: (context, state) {
          if (state is UserChangeSelectedCategoryIndexState){
            if(state.selectedCategoryIndex==widget.index){
                widget.itemHidden = false;
            }
            else {
                widget.itemHidden = true;
            }
          }
          return InkWell(
            borderRadius: BorderRadius.circular(36),
            onTap: () {

              widget.categoryStoresCubit.changeSelectedCategoryIndex(index: widget.index!);
              widget.categoryStoresCubit.getUserAllCategoriesStores();
              // widget.index==0?              widget.categoryStoresCubit.getUserAllCategoriesStores():;

            },
            child: Opacity(
              opacity: widget.itemHidden ? 0.5 : 1,
              child:widget.index!=0?Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: defaultYellow, width: 1),
                    ),
                    child: ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: DefaultCachedNetworkImage(
                        imageUrl: widget.category.categoryImage.path.toString(),
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  DefaultText(
                    text: widget.category.name,
                    textStyle: Theme.of(context).textTheme.caption,
                  )
                ],
              ): Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: widget.index!=0?defaultYellow:darkBlue, width: 1),
                    ),
                    child: Center(
                      child: DefaultText(
                        text: 'الكل',
                        textStyle: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
