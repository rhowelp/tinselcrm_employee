import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tinselcrm_employee/common/shared_widgets/color.dart';
import 'package:tinselcrm_employee/common/shared_widgets/textformfield_style.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      this.controller,
      this.focusNode,
      this.isPassword,
      this.labelText,
      this.hintText,
      this.obscureText,
      this.minlines = 1,
      this.maxlines = 1,
      this.validators,
      this.autovalidateMode,
      this.keyboardType,
      this.textInputAction,
      this.textCapitalization,
      this.validator,
      this.enabled,
      this.fillcolor,
      this.prefixIcon,
      this.onEditingComplete,
      this.onChanged,
      this.suffixIcon,
      this.suffixText,
      this.readOnly = false,
      this.onFieldSubmitted,
      this.onTap,
      this.errorText,
      this.suffix,
      this.autofillHints,
      this.helperText,
      this.borderColor = true});

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? isPassword;
  final bool? obscureText;
  final int minlines;
  final int maxlines;
  final List<String? Function(String?)>? validators;
  final void Function()? onEditingComplete;
  final dynamic Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final Color? fillcolor;
  final bool? enabled;
  final Widget? suffixIcon;
  final String? suffixText;
  final bool readOnly;
  final String? errorText;
  final dynamic Function(String?)? onFieldSubmitted;
  final Widget? suffix;
  final void Function()? onTap;
  final Iterable<String>? autofillHints;
  final String? helperText;
  final bool borderColor;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isObscuring = false;
  bool _isPassword = false;
  @override
  void initState() {
    super.initState();
    _isPassword = widget.isPassword ?? false;
    if (_isPassword) {
      _isObscuring = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autovalidateMode,
      controller: widget.controller,
      onTap: widget.onTap,
      minLines: widget.minlines,
      maxLines: widget.maxlines,
      onEditingComplete: widget.onEditingComplete,
      obscureText: _isObscuring,
      obscuringCharacter: '*',
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      style: widget.enabled ?? true
          ? GoogleFonts.manrope(color: Colors.black)
          : GoogleFonts.manrope(color: Colors.grey),
      enabled: widget.enabled ?? true,
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly,
      onChanged: widget.onChanged,
      autofillHints: widget.autofillHints,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText ?? '',
        helperText: widget.helperText,
        errorText: widget.errorText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        hintStyle: GoogleFonts.manrope(color: ColorPalette.grey, fontSize: 13),
        errorStyle: GoogleFonts.manrope(color: Colors.red, fontSize: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              width: 1,
              color: widget.borderColor
                  ? ColorPalette.grey.withOpacity(0.3)
                  : ColorPalette.white),
        ),
        focusedBorder: TextFormFieldStyles.focusedBorder,
        disabledBorder: TextFormFieldStyles.disabledBorder,
        errorBorder: TextFormFieldStyles.errorBorder,
        focusedErrorBorder: TextFormFieldStyles.focusedErrorBorder,
        filled: true,
        fillColor: widget.fillcolor ?? Colors.white,
        alignLabelWithHint: true,
        focusColor: Colors.blue,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _isPassword
            ? GestureDetector(
                onTap: () => setState(() {
                  _isObscuring = !_isObscuring;
                }),
                child: _isObscuring
                    ? const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      )
                    : const Icon(Icons.visibility, color: Colors.grey),
              )
            : widget.suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
      ),
    );
  }
}
