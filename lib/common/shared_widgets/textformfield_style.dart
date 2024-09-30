import 'package:flutter/material.dart';
import 'package:tinselcrm_employee/common/shared_widgets/color.dart';

class TextFormFieldStyles {
  static InputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.grey),
  );

  static InputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
        color: ColorPalette.primaryColor.withOpacity(0.3), width: 2.5),
  );

  static InputBorder disabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.grey, width: 2),
  );

  static InputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.red),
  );

  static InputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(color: Colors.red, width: 2),
  );
}

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) {
      return '';
    }
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
