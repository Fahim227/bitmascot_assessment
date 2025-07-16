import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.buttonColor,
    required this.buttonContent,
    required this.onTap,
  });

  final double width;
  final double height;
  final Color borderColor;
  final Color buttonColor;
  final Widget buttonContent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: buttonColor,
            elevation: 0.0,
            side: BorderSide(color: borderColor),
            //set border for the button
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onPressed: onTap,
          child: buttonContent,
        ),
      ),
    );
  }
}
