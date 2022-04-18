import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_families/data/models/user_models/category/user_all_categories_model.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../../business_logic/user/stores/user_all_and_single_category_stores_cubit.dart';
import '../../../../../constants/constant_methods.dart';

class MarketSectionItem extends StatefulWidget {
  final int? index;
  final Categories category;
  final UserAllAndSingleCategoryStoresCubit categoryStoresCubit;

  MarketSectionItem({
    Key? key,
    required this.index,
    required this.category,
    required this.categoryStoresCubit,
  }) : super(key: key);

  @override
  State<MarketSectionItem> createState() => _MarketSectionItemState();
}

class _MarketSectionItemState extends State<MarketSectionItem> {
  late bool itemHidden;
  @override
  void initState() {

    itemHidden=true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.categoryStoresCubit.selectedCategoryIndex == widget.index) {
      if(widget.index==0){
        widget.categoryStoresCubit.getUserAllCategoriesStores();
      }
      else{
        widget.categoryStoresCubit.getUserSingleCategoriesStores(categoryId: widget.category.id);

      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4),
      child: BlocBuilder<UserAllAndSingleCategoryStoresCubit,
          UserAllAndSingleCategoryStoresStates>(
        builder: (context, state) {
            if (widget.categoryStoresCubit.selectedCategoryIndex == widget.index) {
              itemHidden = false;
            } else {
              itemHidden = true;
            }
          return InkWell(
            borderRadius: BorderRadius.circular(36),
            onTap: () {
              widget.categoryStoresCubit
                  .changeSelectedCategoryIndex(index: widget.index!);
              if (widget.categoryStoresCubit.selectedCategoryIndex == widget.index) {
                if(widget.index==0){
                  widget.categoryStoresCubit.getUserAllCategoriesStores();
                }
                else{
                  widget.categoryStoresCubit.getUserSingleCategoriesStores(categoryId: widget.category.id);

                }
              }
            },
            child: Opacity(
              opacity: itemHidden ? 0.5 : 1,
              child: widget.index != 0
                  ? Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: defaultYellow, width: 1),
                          ),
                          child: ClipOval(
                            clipBehavior: Clip.antiAlias,
                            child: DefaultCachedNetworkImage(
                              imageUrl:
                                  widget.category.categoryImage.path.toString(),
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
                    )
                  : Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: widget.categoryStoresCubit
                                            .selectedCategoryIndex !=
                                        0
                                    ? defaultYellow
                                    : darkBlue,
                                width: 1),
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
