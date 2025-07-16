import 'package:bitmascot_assessment/core/widgets/common_input_field.dart';
import 'package:flutter/material.dart';

class CommonInputFieldWithTitle extends StatelessWidget {
  const CommonInputFieldWithTitle({
    super.key,
    this.title,
    this.readOnly = false,
    required this.isRequired,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.validator,
    this.prefixIcon,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.onEditingComplete,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  final bool readOnly;
  final String? title;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final bool isRequired;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text.rich(
            TextSpan(
              text: title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              children: !isRequired
                  ? []
                  : const <TextSpan>[
                      TextSpan(
                        text: " *",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
            ),
          ),
          const SizedBox(height: 8),
        ],
        CommonInputField(
          readOnly: readOnly,
          controller: controller,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          validator: validator,
          maxLines: maxLines,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
