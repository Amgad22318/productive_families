
import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final Color? backgroundColor;
  final Color? textColor;
  final double radius;
  final double? height;
  final int? maxLines;
  final double horizontalPadding;
  final InputBorder? inputBorder;
  final InputBorder? inputEnabledBorder;
  final InputBorder? inputFocusedBorder;
  final InputBorder? inputDisabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final AlignmentGeometry? containerAlignment;


  const DefaultFormField(
      {Key? key,
      required this.controller,
      required this.validator,
      this.onTap,
      this.labelText,
      required this.keyboardType,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.onChanged,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.initialValue,
      this.hintText = 'أكتب هنا..',
      this.backgroundColor = formFieldBackGroundLightBlue,
      this.height = 50, 
      this.radius = 30.0,
      this.maxLines,
      this.enabled = true,
      this.inputBorder = InputBorder.none,
      this.inputEnabledBorder,
      this.inputFocusedBorder,
      this.inputDisabledBorder,
      this.horizontalPadding = 16,
      this.textColor = Colors.white, this.contentPadding, this.containerAlignment})

      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: containerAlignment ,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: TextFormField(
        enabled: enabled,
        textAlignVertical: TextAlignVertical.center,
        maxLines: maxLines,
        textDirection: TextDirection.rtl,
        initialValue: initialValue,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: obscureText,
        style: TextStyle(
          color: textColor,
        ),
        decoration: InputDecoration(
          contentPadding:contentPadding,
          isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIconConstraints: const BoxConstraints(
              minHeight: 0,
              minWidth: 0,
              maxWidth: double.infinity,
              maxHeight: double.infinity),
          labelStyle:
              Theme.of(context).textTheme.bodyText1!.copyWith(color: darkBlue),
          labelText: labelText,
          border: inputBorder,
          enabledBorder: inputEnabledBorder,
          disabledBorder: inputDisabledBorder,
          focusedBorder: inputFocusedBorder,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          hintTextDirection: TextDirection.rtl,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
