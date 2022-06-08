import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productive_families/business_logic/user/rate_product/rate_product_cubit.dart';
import 'package:productive_families/constants/enums.dart';
import 'package:productive_families/constants/weights.dart';
import 'package:productive_families/presentation/styles/colors.dart';
import 'package:productive_families/presentation/widgets/DefaultSvg.dart';
import 'package:productive_families/presentation/widgets/default_form_field.dart';
import 'package:productive_families/presentation/widgets/default_loading_indicator.dart';
import 'package:productive_families/presentation/widgets/default_material_button.dart';
import 'package:productive_families/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/constant_methods.dart';
import '../../shared/image_picker/image_picker_dialog.dart';

class OrderDetailsBottomSheet extends StatefulWidget {
  final int productId;

  const OrderDetailsBottomSheet({Key? key, required this.productId})
      : super(key: key);

  @override
  State<OrderDetailsBottomSheet> createState() =>
      _OrderDetailsBottomSheetState();
}

class _OrderDetailsBottomSheetState extends State<OrderDetailsBottomSheet> {
  final TextEditingController commentController = TextEditingController();
  late double rate;
  XFile? rateImage;
  late UserRateProductCubit _userRateProductCubit;
  late bool isSending;

  @override
  void initState() {
    isSending = false;
    rate = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRateProductCubit(),
      child: BlocListener<UserRateProductCubit, UserRateProductState>(
        listener: (context, state) {
          if (state is UserRateProductSuccessState) {
            showToastMsg(msg: state.msg, toastState: ToastStates.SUCCESS);
            Navigator.pop(context);
          } else if (state is UserRateProductErrorState) {
            setState(() {
              isSending = false;
            });
            showToastMsg(msg: state.msg, toastState: ToastStates.ERROR);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0))),
          child: Wrap(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: DefaultText(
                  text: 'تقييم المنتج',
                  fontSize: 18.sp,
                  fontWeight: FontWeights.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ImagePickerDialog(
                                      cameraOnTap: () {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.camera)
                                            .then((image) {
                                          if (image != null) {
                                            setState(() {
                                              rateImage = image;
                                            });
                                          }
                                        });
                                      },
                                      galleryOnTap: () {
                                        Navigator.pop(context);
                                        pickImage(ImageSource.gallery)
                                            .then((image) {
                                          if (image != null) {
                                            setState(() {
                                              rateImage = image;
                                            });
                                          }
                                        });
                                      },
                                    ));
                          },
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                                color: grey2,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            width: 140,
                            height: 100,
                            child: Image.file(
                              File(rateImage == null ? '' : rateImage!.path),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Padding(
                                padding: EdgeInsetsDirectional.all(38),
                                child: DefaultSvg(
                                  imagePath: 'assets/icons/add_picture.svg',
                                ),
                              ),
                            ),
                          ),
                        )),
                    RatingBar.builder(
                      itemSize: 20,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        rate = rating;
                      },
                    ),
                    DefaultText(text: 'تعليقك', fontSize: 16.sp),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: DefaultFormField(
                        height: 100,
                        controller: commentController,
                        keyboardType: TextInputType.multiline,
                        backgroundColor: orderFormFieldBackGroundGrey,
                        maxLines: 5,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    isSending
                        ? const DefaultLoadingIndicator()
                        : Builder(builder: (context) {
                            return DefaultMaterialButton(
                              onPressed: () {
                                setState(() {
                                  isSending = true;
                                });
                                _userRateProductCubit =
                                    UserRateProductCubit.get(context);
                                _userRateProductCubit.rateProduct(
                                    comment: commentController.text,
                                    productId: widget.productId,
                                    rate: rate.toInt(),
                                    image: rateImage);
                              },
                              text: 'تقييم',
                            );
                          })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
