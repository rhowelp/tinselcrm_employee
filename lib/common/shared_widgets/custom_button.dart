import 'package:flutter/material.dart';
import 'package:tinselcrm_employee/common/shared_widgets/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.width,
    this.height,
    required this.title,
    this.fontSize,
    this.titleColor,
    this.bgColor,
    this.boxShadow,
    required this.onPressed,
    this.borderRadius,
    this.elevation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String title;
  final double? fontSize;
  final BoxShadow? boxShadow;
  final Color? titleColor;
  final Color? bgColor;
  final dynamic Function()? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: elevation ?? 5,
          backgroundColor: bgColor ?? ColorPalette.primaryColor,
          disabledForegroundColor:
              (bgColor ?? ColorPalette.primaryColor).withOpacity(0.38),
          disabledBackgroundColor:
              (bgColor ?? ColorPalette.primaryColor).withOpacity(0.12),
          shadowColor: bgColor ?? ColorPalette.primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: titleColor == null ? 0 : 1,
              color: bgColor ?? ColorPalette.primaryColor,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: titleColor ?? ColorPalette.white,
            fontSize: fontSize ?? 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
