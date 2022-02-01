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
  final void Function()? suffixIconOnPressed;
  final bool obscureText;
  final bool enabled;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final Color? suffixIconColor;
  final Color? backgroundColor;
  final double radius;
  final double? height;
  final int? maxLines;

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
        this.suffixIconOnPressed,
        this.prefixIcon,
        this.suffixIcon,
        this.initialValue,
        this.suffixIconColor,
        this.hintText = 'أكتب هنا..',
        this.backgroundColor = formFieldBackGroundLightBlue,
        this.radius=30.0, this.height = 50, this.maxLines, this.enabled=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius:  BorderRadius.all(Radius.circular(radius))),
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
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          hintTextDirection: TextDirection.rtl,
          prefixIcon: Icon(
            prefixIcon,
          ),
          suffixIcon: IconButton(
            onPressed: suffixIconOnPressed,
            icon: Icon(
              suffixIcon,
              color: suffixIconColor,
            ),
          ),
        ),
      ),
    );
  }

}