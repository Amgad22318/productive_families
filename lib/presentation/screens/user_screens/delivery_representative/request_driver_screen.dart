import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/business_logic/user/request_driver/user_request_driver_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_icon_button.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

class RequestDriverScreen extends StatefulWidget {
  const RequestDriverScreen({Key? key}) : super(key: key);

  @override
  State<RequestDriverScreen> createState() => _RequestDriverScreenState();
}

class _RequestDriverScreenState extends State<RequestDriverScreen> {
  final TextEditingController noteController = TextEditingController();
  late UserRequestDriverCubit _userRequestDriverCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRequestDriverCubit(),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          height: 80,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                color: Colors.black,
              ),
            )
          ],
          title: const DefaultText(
            text: 'مندوب التوصيل',
            textStyle: TextStyle(),
          ),
        ),
        body: Column(
          children: [
            const Image(
                image: AssetImage('assets/image/appbar_half_circle.png')),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Builder(builder: (context) {
                    _userRequestDriverCubit =
                        UserRequestDriverCubit.get(context);

                    return BlocConsumer<UserRequestDriverCubit,
                        UserRequestDriverState>(
                      listener: (context, state) {
                        if (state is RequestDriverSuccessState) {
                          showToastMsg(
                              msg: state.msg, toastState: ToastStates.SUCCESS);
                          Navigator.pushNamed(context, QUOTATIONS_SCREEN);
                        } else if (state is RequestDriverErrorState) {
                          showToastMsg(
                              msg: state.msg, toastState: ToastStates.ERROR);
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                DefaultText(
                                  text: 'من',
                                  textStyle:
                                      Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                DefaultIconButton(
                                  background: backGroundWhite,
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        REQUEST_DRIVER_FROM_LOCATION_SCREEN,
                                        arguments: _userRequestDriverCubit);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icons/location.svg",
                                    color: Colors.black,
                                    width: 25,
                                    height: 25,
                                  ),
                                )
                              ],
                            ),
                            DefaultFormField(
                              controller: _userRequestDriverCubit
                                  .fromLocationController,
                              keyboardType: TextInputType.text,
                              backgroundColor: orderFormFieldBackGroundGrey,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                DefaultText(
                                  text: 'إلى',
                                  textStyle:
                                      Theme.of(context).textTheme.headline6,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                DefaultIconButton(
                                  background: backGroundWhite,
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        REQUEST_DRIVER_TO_LOCATION_SCREEN,
                                        arguments: _userRequestDriverCubit);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icons/location.svg",
                                    color: Colors.black,
                                    width: 25,
                                    height: 25,
                                  ),
                                )
                              ],
                            ),
                            DefaultFormField(
                              controller:
                                  _userRequestDriverCubit.toLocationController,
                              keyboardType: TextInputType.text,
                              backgroundColor: orderFormFieldBackGroundGrey,
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                DefaultText(
                                  text: 'إضافة ملاحظات',
                                  textStyle:
                                      Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                            DefaultFormField(
                              height: 100,
                              controller: noteController,
                              keyboardType: TextInputType.multiline,
                              backgroundColor: orderFormFieldBackGroundGrey,
                              maxLines: 5,
                            ),
                            const SizedBox(height: 60),
                            Builder(builder: (context) {
                              if (state is RequestDriverLoadingState) {
                                return const DefaultLoadingIndicator();
                              } else {
                                return DefaultMaterialButton(
                                  onPressed: () {
                                    if (_userRequestDriverCubit
                                            .fromLocationController
                                            .text
                                            .isNotEmpty &&
                                        _userRequestDriverCubit
                                            .toLocationController
                                            .text
                                            .isNotEmpty) {
                                      _userRequestDriverCubit.requestDriver(
                                          note: noteController.text);
                                    } else {
                                      showToastMsg(
                                          msg: 'اختر العنوان',
                                          toastState: ToastStates.ERROR);
                                    }
                                  },
                                  text: 'تأكيد الطلب',
                                  textColor: darkBlue,
                                );
                              }
                            })
                          ],
                        );
                      },
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
