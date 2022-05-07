import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:productive_families/business_logic/user/start_order_process_and_order_location/user_start_order_process_and__order_location_cubit.dart';
import 'package:productive_families/constants/constant_methods.dart';
import 'package:productive_families/constants/end_points.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/data/data_provider/local/cache_helper.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_shop_appbar.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';

import '../../../../constants/shared_preferences_keys.dart';

class OrderConfirmationScreen extends StatefulWidget {
  OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController discountCodeController = TextEditingController();
  final TextEditingController addNoteController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late UserStartOrderProcessAndOrderLocationCubit _startOrderAndLocationCubit;

  @override
  void initState() {
    nameController.text = CacheHelper.getDataFromSP(
        key: SharedPreferencesKeys.SP_ACCOUNT_NAME_KEY);
    phoneNumberController.text = CacheHelper.getDataFromSP(
        key: SharedPreferencesKeys.SP_ACCOUNT_PHONE_KEY);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserStartOrderProcessAndOrderLocationCubit(),
      child: Scaffold(
        appBar: DefaultShopAppbar(
          height: 80,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
            )
          ],
          title: const DefaultText(
            text: 'تأكيد الطلب',
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
                    _startOrderAndLocationCubit =
                        UserStartOrderProcessAndOrderLocationCubit.get(context);
                    return BlocListener<
                        UserStartOrderProcessAndOrderLocationCubit,
                        UserStartOrderProcessAndOrderLocationState>(
                      listener: (context, state) {
                        if (state is UserPromoCodeSuccessState) {
                          showToastMsg(
                              msg: state.message,
                              toastState: ToastStates.SUCCESS);
                        } else if (state is UserWrongPromoCodeState) {
                          showToastMsg(
                              msg: state.message,
                              toastState: ToastStates.ERROR);
                        }
                      },
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              text: 'الاسم الاول',
                              textStyle: Theme.of(context).textTheme.headline6,
                            ),
                            DefaultFormField(
                              textColor: darkBlue,
                              enabled: false,
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              backgroundColor: orderFormFieldBackGroundGrey,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DefaultText(
                              text: 'رقم الهاتف',
                              textStyle: Theme.of(context).textTheme.headline6,
                            ),
                            DefaultFormField(
                              cursorColor: darkBlue,
                              textColor: darkBlue,
                              controller: phoneNumberController,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'رقم الهاتف فارغ';
                                }
                              },
                              keyboardType: TextInputType.phone,
                              backgroundColor: orderFormFieldBackGroundGrey,
                            ),
                            const SizedBox(height: 20),
                            DefaultText(
                              text: 'كود الخصم',
                              textStyle: Theme.of(context).textTheme.headline6,
                            ),
                            DefaultFormField(
                              cursorColor: darkBlue,
                              textColor: darkBlue,
                              controller: discountCodeController,
                              keyboardType: TextInputType.text,
                              backgroundColor: orderFormFieldBackGroundGrey,
                              onFieldSubmitted: (text) {
                                _startOrderAndLocationCubit.userPromoCodeCheck(
                                    code: text);
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                DefaultText(
                                  text: 'العنوان بالتفصيل',
                                  textStyle:
                                      Theme.of(context).textTheme.headline6,
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, ORDER_LOCATION_PICKING_SCREEN,
                                        arguments: _startOrderAndLocationCubit);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/icons/location.svg",
                                    color: Colors.black,
                                    width: 24,
                                    height: 24,
                                  ),
                                )
                              ],
                            ),
                            DefaultFormField(
                              cursorColor: darkBlue,
                              textColor: darkBlue,
                              height: 100,
                              controller: _startOrderAndLocationCubit
                                  .locationController,
                              validator: (p0) {},
                              keyboardType: TextInputType.multiline,
                              backgroundColor: orderFormFieldBackGroundGrey,
                              maxLines: 5,
                            ),
                            const SizedBox(height: 20),
                            DefaultText(
                              text: 'إضافة ملاحظات',
                              textStyle: Theme.of(context).textTheme.headline6,
                            ),
                            DefaultFormField(
                              cursorColor: darkBlue,
                              textColor: darkBlue,
                              height: 100,
                              controller: addNoteController,
                              validator: (p0) {},
                              keyboardType: TextInputType.multiline,
                              backgroundColor: orderFormFieldBackGroundGrey,
                              maxLines: 5,
                            ),
                            const SizedBox(height: 40),
                            DefaultMaterialButton(
                              textColor: darkBlue,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  _startOrderAndLocationCubit
                                      .userStartOrderProcess(
                                          address: _startOrderAndLocationCubit
                                              .locationController.text,
                                          lat: _startOrderAndLocationCubit.lat,
                                          lon: _startOrderAndLocationCubit.lon,
                                          note: addNoteController.text,
                                          userPhone: phoneNumberController.text,
                                          voucherID: _startOrderAndLocationCubit
                                              .userPromoCodeDetailsModel
                                              .voucher
                                              .id);
                                }
                                Navigator.pushNamed(
                                    context, ORDER_ADDRESS_CONFIRMATION_SCREEN);
                              },
                              text: 'تأكيد الطلب',
                            )
                          ],
                        ),
                      ),
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
