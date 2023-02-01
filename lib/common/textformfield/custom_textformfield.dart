import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/constant_colors.dart';

/// This widget is used to refactor the
/// textformfield with some parameters.

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.inputFormats,
    this.keyboardType,
    required this.hintText,
    required this.textEditingController,
    required this.onTap,
    required this.obscureText,
    this.suffixIconButton,
  });

  final String labelText;
  final String hintText;
  final List<TextInputFormatter>? inputFormats;
  final TextInputType? keyboardType;
  final TextEditingController textEditingController;
  final String? Function() onTap;

  final bool obscureText;
  final IconButton? suffixIconButton;

  @override
  Widget build(BuildContext context) {
    // Variable for calculating the size of the divice.
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      controller: textEditingController,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormats,
      cursorColor: ConstantColors.blackColor,
      decoration: InputDecoration(
        suffixIcon: suffixIconButton,
        hintText: hintText,
        labelStyle: const TextStyle(
          color: ConstantColors.blackColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          borderSide: const BorderSide(
            color: ConstantColors.blackColor,
          ),
        ),
        labelText: labelText,
        focusColor: ConstantColors.blackColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
      ),
      validator: (String? value) {
        return onTap();
      },
    );
  }
}
