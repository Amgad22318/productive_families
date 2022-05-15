import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/views/screen_views/user_screen_views/profile/profile_bottom_sheet.dart';
import 'package:productive_families/presentation/widgets/default_cached_network_image.dart';
import 'package:productive_families/presentation/widgets/default_error_widget.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../business_logic/user/profile/user_profile_cubit.dart';
import '../../../../data/models/shared_models/shared_classes/api_account.dart';
import '../../../views/screen_views/user_screen_views/profile/update_profile_image_bottom_sheet.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> profileFormKey = GlobalKey<FormState>();

  late UserProfileCubit _userProfileCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileCubit()..getUserProfileData(),
      child: BlocConsumer<UserProfileCubit, UserProfileState>(
        listener: (context, state) {
          if (state is UserUpdateProfileSuccessState) {
            showToastMsg(msg: state.message, toastState: ToastStates.SUCCESS);
          } else if (state is UserUpdateProfileErrorState) {
            showToastMsg(msg: state.message, toastState: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          if (state is UserGetProfileSuccessState ||
              state is UserUpdateProfileSuccessState ||
              state is UserUpdateProfileErrorState) {
            _userProfileCubit = UserProfileCubit.get(context);
            ApiAccount accountModel =
                _userProfileCubit.userGetProfileModel.account;
            return Scaffold(
              appBar: DefaultShopAppbar(
                height: 200,
                centerTitle: true,
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 32,
                        ),
                        DefaultText(
                          text: 'مستخدم',
                          textStyle: Theme.of(context).textTheme.headline5,
                        ),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (context) => ProfileBottomSheet(
                                  accountType: 'مستخدم',
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 20,
                            ))
                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        ClipOval(
                          clipBehavior: Clip.antiAlias,
                          child: DefaultCachedNetworkImage(
                            imageUrl: accountModel.image.path.toString(),
                            fit: BoxFit.cover,
                            width: 140,
                            height: 140,
                          ),
                        ),
                        DefaultIconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (builder) {
                                  return UpdateProfileImageBottomSheet(
                                      userProfileCubit: _userProfileCubit);
                                });
                          },
                          icon: const Icon(
                            Icons.photo_camera_outlined,
                            color: Colors.white,
                          ),
                          background: darkBlue,
                          radius: 24,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              body: Builder(builder: (context) {
                nameController.text = accountModel.name;
                phoneController.text = accountModel.phone;
                _userProfileCubit.userLocationController.text =
                    accountModel.address.address;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      DefaultFormField(
                        hintText: '',
                        textColor: darkBlue,
                        height: 60,
                        horizontalPadding: 32,
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        backgroundColor: Colors.transparent,
                        labelText: 'الأسم',
                        inputEnabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkBlue,
                          ),
                        ),
                        inputFocusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: darkBlue),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DefaultFormField(
                        hintText: '',
                        textColor: darkBlue,
                        height: 60,
                        horizontalPadding: 32,
                        controller: phoneController,
                        keyboardType: TextInputType.text,
                        backgroundColor: Colors.transparent,
                        labelText: 'رقم الهاتف',
                        onFieldSubmitted: (text){
                          if (nameController.text != accountModel.name ||
                              phoneController.text != accountModel.phone) {
                            _userProfileCubit.updateUserProfile(
                                phone: phoneController.text,
                                name: nameController.text,
                                image: null,
                                mode: 1);
                          }
                        },
                        inputEnabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkBlue,
                          ),
                        ),
                        inputFocusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: darkBlue),
                        ),
                        suffixIcon: SizedBox(
                          height: 24,
                          width: 24,
                          child: IconButton(
                              onPressed: () {},
                              padding: EdgeInsetsDirectional.zero,
                              iconSize: 18,
                              icon: const Icon(
                                Icons.edit,
                                color: darkBlue,
                              )),
                        ),

                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      DefaultFormField(
                        height: 60,
                        labelText: 'العنوان',
                        hintText: '',
                        textColor: darkBlue,
                        horizontalPadding: 32,
                        controller: _userProfileCubit.userLocationController,
                        keyboardType: TextInputType.text,
                        backgroundColor: Colors.transparent,
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 51,
                          onPressed: () {
                            Navigator.pushNamed(context, UPDATE_USER_LOCATION,
                                arguments: _userProfileCubit);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/location.svg',
                            color: darkBlue,
                            width: 24,
                            height: 24,
                          ),
                        ),
                        inputEnabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: darkBlue,
                          ),
                        ),
                        inputFocusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: darkBlue),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/points.svg',
                                    height: 24,
                                    width: 24,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    child: DefaultText(
                                      text: '${accountModel.points}',
                                      textStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  DefaultText(
                                    text: 'عدد النقاط',
                                    color: greyText,
                                    textStyle:
                                        Theme.of(context).textTheme.bodyText2,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  CircularPercentIndicator(
                                    circularStrokeCap: CircularStrokeCap.round,
                                    lineWidth: 13.0,
                                    animation: true,
                                    progressColor: defaultYellow,
                                    percent: accountModel.totalOrders == 0
                                        ? 0
                                        : accountModel.totalOrders / 100,
                                    backgroundColor: Colors.grey,
                                    radius: 60,
                                    center: DefaultText(
                                      textStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                      text: '${accountModel.totalOrders}\nطلب',
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/coin.svg',
                                    width: 24,
                                    height: 24,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: DefaultText(
                                      text: '${accountModel.balance}',
                                      textStyle:
                                          Theme.of(context).textTheme.bodyText1,
                                      textScaleFactor: 0.9,
                                    ),
                                  ),
                                  DefaultText(
                                    text: 'رصيد',
                                    textStyle:
                                        Theme.of(context).textTheme.bodyText2,
                                    color: greyText,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 16, end: 16, bottom: 32),
                        child: DefaultMaterialButton(
                          height: 50,
                          onPressed: () {
                            if (nameController.text != accountModel.name ||
                                phoneController.text != accountModel.phone) {
                              _userProfileCubit.updateUserProfile(
                                  phone: phoneController.text,
                                  name: nameController.text,
                                  image: null,
                                  mode: 1);
                            }
                          },
                          text: 'حفظ التغييرات',
                        ),
                      )
                    ],
                  ),
                );
              }),
            );
          } else if (state is UserGetProfileLoadingState ||
              state is UserUpdateProfileLoadingState) {
            return Scaffold(
              appBar: DefaultShopAppbar(
                height: 200,
              ),
              body: const DefaultLoadingIndicator(),
            );
          } else {
            return const Scaffold(
              body: DefaultErrorWidget(),
            );
          }
        },
      ),
    );
  }
}
