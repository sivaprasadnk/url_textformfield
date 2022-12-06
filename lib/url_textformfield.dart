library url_textformfield;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///  Widget to make entering urls easy, without the need to type  always the leading "https://"
///  and trailing ".com" . The widget wil show these as leading and trailing texts as th euser types.
///
///  [onChanged] paramater is mandatory, and is used to track the input changes
///
///  [focusNode] paramter is mandatory, and is used to focus the textfield by tapping
///   anywhere in the textfield
///
///  [leadingText] paramter is optional. Sets the leading text.
///
///  [trailingText] paramter is optional. Sets the trailing text.
///
///  [controller] parameter is optional.
///
///  [textInputType] parameter is optional. Sets the input type of textfield .
///
///  [padding] parameter is optional. Sets the padding of the textfield.
///
///  [inputFormatters] paramater is optional. Sets how the input is formatted.
///
///  [borderRadius] paramater is optional. Sets the border radius of the textfield. Defaults to 8.
///
///  [borderColor] paramater is optional. Sets the border color of the textfield. Defaults to Colors.grey.
///
///  [height] paramater is optional. Sets the height color of the textfield. Defaults to 54.
///
///

class UrlTextFormField extends StatelessWidget {
  const UrlTextFormField({
    required this.onChanged,
    required this.focusNode,
    super.key,
    this.leadingText,
    this.trailingText,
    this.controller,
    this.suffixIcon,
    this.textInputType,
    this.padding,
    this.inputFormatters = const [],
    this.borderRadius = 8,
    this.borderColor = Colors.grey,
    this.height = 54,
  });

  final Function(String) onChanged;
  final FocusNode focusNode;

  final TextEditingController? controller;
  final String? leadingText;
  final String? trailingText;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter> inputFormatters;
  final double borderRadius;
  final Color borderColor;
  final double height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.requestFocus(),
      child: Container(
        margin: padding,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          children: [
            if (leadingText != null && leadingText!.isNotEmpty)
              Text(
                leadingText!,
                style: const TextStyle(fontSize: 17, color: Colors.grey),
              ),
            IntrinsicWidth(
              child: TextFormField(
                focusNode: focusNode,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                autofocus: true,
                controller: controller,
                onChanged: (val) {
                  onChanged(val);
                },
                keyboardType: textInputType,
                inputFormatters: inputFormatters,
              ),
            ),
            if (trailingText != null)
              Text(
                trailingText!,
                style: const TextStyle(fontSize: 17, color: Colors.grey),
              ),
            const Spacer(),
            if (suffixIcon != null) suffixIcon!
          ],
        ),
      ),
    );
  }
}
