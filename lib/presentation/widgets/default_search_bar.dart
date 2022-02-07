import 'package:flutter/material.dart';
import 'package:productive_families/presentation/styles/colors.dart';

class DefaultSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;

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

  final EdgeInsetsGeometry? contentPadding;

  const DefaultSearchBar(
      {Key? key,
      required this.controller,
      this.validator,
      this.onTap,
      this.labelText,
      required this.keyboardType,
      this.onFieldSubmitted,
      this.onEditingComplete,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.initialValue,
      this.hintText = 'بحث',
      this.backgroundColor = Colors.transparent,
      this.height = 50,
      this.radius = 30.0,
      this.maxLines,
      this.enabled = true,
      this.inputBorder = InputBorder.none,
      this.horizontalPadding = 16,
      this.textColor = Colors.white,
      this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          border: Border.all(width: 1, color: Colors.grey)),
      child: TextFormField(
        cursorColor: Colors.black,
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
        style: TextStyle(
          color: textColor,
        ),
        decoration: InputDecoration(
          contentPadding: contentPadding,
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
