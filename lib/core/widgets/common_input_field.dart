import 'package:flutter/material.dart';

class CommonInputField extends StatelessWidget {
  const CommonInputField({
    super.key,
    this.enabled = true,
    this.isPasswordHide,
    this.readOnly = false,
    this.maxLength,
    this.fillColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.keyboardType = TextInputType.text,
    this.focusNode,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onEditingComplete,
    this.onSubmitted,
    this.onChanged,
    this.validator,
    this.maxLines = 1,
    this.minLines,
    this.counterText,
    this.onTap,
  });

  final bool enabled;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final Color fillColor;
  final Color borderColor;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final String? hintText;
  final bool? isPasswordHide;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String)? onSubmitted;
  final String? counterText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final contentPadding = isMultiline
        ? const EdgeInsets.all(16)
        : const EdgeInsets.symmetric(horizontal: 16);
    final InputDecorationTheme inputDecorationTheme =
        Theme.of(context).inputDecorationTheme;
    return TextFormField(
      readOnly: readOnly,
      enabled: enabled,
      obscureText: isPasswordHide ?? false,
      maxLength: maxLength,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType,
      controller: controller,
      cursorColor: Colors.black,
      focusNode: focusNode,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        contentPadding: contentPadding,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        focusColor: Colors.white,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        counterText: counterText,
        border: _border(context, inputDecorationTheme.border),
        enabledBorder: _border(context, inputDecorationTheme.enabledBorder),
        focusedBorder: _border(context, inputDecorationTheme.focusedBorder),
        disabledBorder: _border(context, inputDecorationTheme.disabledBorder),
        errorBorder: _border(context, inputDecorationTheme.errorBorder),
        focusedErrorBorder:
            _border(context, inputDecorationTheme.focusedErrorBorder),
      ),
      maxLines: maxLines,
      minLines: minLines,
    );
  }

  bool get isMultiline => maxLines != null && maxLines! > 1;

  InputBorder? _border(BuildContext context, InputBorder? border) {
    if (border == null) {
      return null;
    }
    if (isMultiline) {
      border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: border.borderSide,
      );
    }
    return border;
  }
}
