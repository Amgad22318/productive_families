import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_families/business_logic/user/favorite_state/user_favorite_state_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_search_bar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../../business_logic/user/favorite_bottom_sheet/user_favorite_bottom_sheet_cubit.dart';
import '../../../../widgets/DefaultSvg.dart';
import '../filtering/filtering_fav_bottom_sheet_group_item.dart';

class FavBottomSheet extends StatefulWidget {
  final int productId;
  const FavBottomSheet({
    Key? key, required this.productId,
  }) : super(key: key);

  @override
  State<FavBottomSheet> createState() => _FavBottomSheetState();
}

class _FavBottomSheetState extends State<FavBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _groupTitleController = TextEditingController();
  final GlobalKey<FormState> groupTitleFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();

  late bool listVisible;

  @override
  void initState() {
    listVisible = true;
    super.initState();
  }

  late UserFavoriteBottomSheetCubit _userFavoriteBottomSheetCubit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserFavoriteStateCubit, UserFavoriteStateStates>(
      listener: (context, state) {
        if (state is UserFavoriteGroupProductAddOrDeleteSuccessState) {
          showToastMsg(msg: state.message, toastState: ToastStates.SUCCESS);
          Navigator.pop(context);
        }
        else if (state is UserFavoriteGroupProductAddOrDeleteFailState) {
          showToastMsg(msg: state.message, toastState: ToastStates.ERROR);
        }
      },
  child: BlocProvider(
      create: (context) =>
          UserFavoriteBottomSheetCubit()..getAllBottomSheetFavoriteGroups(),
      child: Builder(builder: (context) {
        _userFavoriteBottomSheetCubit =
            UserFavoriteBottomSheetCubit.get(context);
        return BlocListener<UserFavoriteBottomSheetCubit,
            UserFavoriteBottomSheetState>(
          listener: (context, state) {
            if (state is UserAddFavoriteGroupSuccessState) {
              showToastMsg(msg: state.message, toastState: ToastStates.SUCCESS);
              _userFavoriteBottomSheetCubit.getAllBottomSheetFavoriteGroups();
              _groupTitleController.clear();
              setState(() {
                listVisible = !listVisible;
              });
            } else if (state is UserAddFavoriteGroupFailState) {
              showToastMsg(msg: state.message, toastState: ToastStates.ERROR);
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0))),
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
                    child: Form(
                      key: searchFormKey,
                      child: DefaultSearchBar(
                          border: Border.all(width: 1, color: Colors.grey),
                          textColor: darkBlue,
                          backgroundColor: Colors.transparent,
                          controller: _searchController,
                          keyboardType: TextInputType.text,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'ابحث هنا';
                            }
                          },
                          onFieldSubmitted: (text) {
                            if (searchFormKey.currentState!.validate()) {
                              _userFavoriteBottomSheetCubit.userGetFavoritesGroupsSearch(keyWord: text);
                            }
                          }),
                    ),
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
                      height: 30.h,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: BlocBuilder<UserFavoriteBottomSheetCubit,
                            UserFavoriteBottomSheetState>(
                          builder: (context, state) {
                            if (state is UserGetAllFavoriteGroupsSuccessState ||
                                state
                                    is UserGetAllFavoriteGroupsSearchSuccessState ||
                                state is UserAddFavoriteGroupFailState) {
                              return ListView.builder(
                                itemBuilder: (context, index) =>
                                    FilteringFavBottomSheetGroupItem(
                                        groupModel: _userFavoriteBottomSheetCubit
                                            .userAllFavoriteGroupsModel
                                            .groups[index],productId: widget.productId),
                                itemCount: _userFavoriteBottomSheetCubit
                                    .userAllFavoriteGroupsModel.groups.length,
                              );
                            } else if (state
                                    is UserGetAllFavoriteGroupsEmptyState ||
                                state
                                    is UserGetAllFavoriteGroupsSearchEmptyState) {
                              return const Center(
                                child: DefaultSvg(
                                  imagePath: 'assets/icons/add_to_favorite.svg',
                                  color: darkBlue,
                                  width: 48,
                                  height: 48,
                                ),
                              );
                            } else if (state
                                    is UserGetAllFavoriteGroupsLoadingState ||
                                state
                                    is UserGetAllFavoriteGroupsSearchLoadingState) {
                              return const DefaultLoadingIndicator();
                            } else {
                              return const DefaultErrorWidget();
                            }
                          },
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
                              Form(
                                key: groupTitleFormKey,
                                child: DefaultFormField(
                                    maxLength: 20,
                                    maxLines: 1,
                                    textColor: darkBlue,
                                    cursorColor: darkBlue,
                                    backgroundColor: formFieldBackGroundGrey,
                                    controller: _groupTitleController,
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return 'ادخل اسم المجموعة';
                                      }
                                    },
                                    keyboardType: TextInputType.text),
                              ),
                              DefaultMaterialButton(
                                text: 'إضافة',
                                onPressed: () {
                                  if (groupTitleFormKey.currentState!
                                      .validate()) {
                                    _userFavoriteBottomSheetCubit
                                        .userAddFavoriteGroup(
                                            title: _groupTitleController.text);
                                  }
                                },
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    ),
);
  }
}
