import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_colors.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_text_style.dart';
import 'package:intl/intl.dart';
import 'package:locavibe_renter_app/src/presentation/utils/app_ui_constants.dart';

class AppPrimaryTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final bool isDatePiker;
  final String label;
  final TextStyle? labelTextStyle;
  final String? hintText;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final bool? isReadOnly;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final bool? enabled;
  final bool? autofocus;
  final int? maxLength;
  final bool? onTapOutsideCloseKeyboard;

  const AppPrimaryTextFormFieldWidget({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.inputFormatters,
    this.textCapitalization,
    this.isDatePiker = false,
    required this.label,
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
    this.keyboardType,
    this.isReadOnly,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.enabled,
    this.autofocus,
    this.maxLength,
    this.onTapOutsideCloseKeyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelTextStyle ?? AppTextStyle.bold(fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          keyboardType: keyboardType,
          controller: controller,
          onTapOutside: (_) {
            // if (onTapOutsideCloseKeyboard != false) {
            //   return FocusScope.of(context).unfocus();
            // }
          },
          inputFormatters: inputFormatters,
          onChanged: ((value) => onChanged != null ? onChanged!(value) : null),
          onSaved: onSaved,
          obscureText: obscureText ?? false,
          enabled: enabled ?? true,
          readOnly: isReadOnly ?? false,
          onTap: () async {
            if (isDatePiker) {
              FocusScope.of(context).requestFocus(FocusNode());
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: controller!.text.isEmpty
                    ? DateTime.now()
                    : DateFormat('dd/MM/yyyy').parse(controller!.text),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
                fieldHintText: "dd/MM/yyyy",
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                locale: const Locale('pt', 'BR'),
              );
              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('dd/MM/yyyy').format(pickedDate);

                controller!.text = formattedDate;
              }
            }
          },
          enableInteractiveSelection: isDatePiker ? false : true,
          autofocus: autofocus ?? false,
          focusNode: focusNode,
          textInputAction: textInputAction ?? TextInputAction.next,
          textAlign: textAlign ?? TextAlign.start,
          validator: validator,
          maxLength: maxLength,
          // style: context.appTextStyles.textRegular.copyWith(
          //   color: context.darkGray,
          // ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: isReadOnly,
            fillColor: const Color(0XFFE5E5E5),
            hintText: hintText,
            hintStyle: AppTextStyle.normal()
                .copyWith(color: AppColors.secondaryText, fontSize: 12),
            border: const OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppUiConstants.radius)),
              borderSide: BorderSide(color: Color(0XFF888888)),
            ),
          ),
          onFieldSubmitted: (value) =>
              onFieldSubmitted != null ? onFieldSubmitted!(value) : null,
        ),
      ],
    );
  }
}
