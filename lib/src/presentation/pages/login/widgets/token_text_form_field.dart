import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_colors.dart';

class TokenTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final TextStyle? labelTextStyle;
  final String? hintText;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool? isReadOnly;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? enabled;
  final bool? autofocus;
  final bool? onTapOutsideCloseKeyboard;

  const TokenTextFormFieldWidget({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.inputFormatters,
    this.textCapitalization,
    this.labelTextStyle,
    this.hintText,
    this.errorText,
    this.validator,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textStyle,
    this.onSaved,
    this.textAlign,
    this.onChanged,
    this.isReadOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.enabled,
    this.autofocus,
    this.onTapOutsideCloseKeyboard,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      keyboardType: TextInputType.number,
      controller: controller,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      onChanged: ((value) => onChanged != null ? onChanged!(value) : null),
      onSaved: onSaved,
      obscureText: obscureText ?? false,
      enabled: enabled ?? true,
      readOnly: isReadOnly ?? false,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      textInputAction: textInputAction ?? TextInputAction.next,
      textAlign: textAlign ?? TextAlign.start,
      validator: validator,
      // maxLength: 1,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
      ],
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.gray, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
      onFieldSubmitted: (value) =>
          onFieldSubmitted != null ? onFieldSubmitted!(value) : null,
    );
  }
}
