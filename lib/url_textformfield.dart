library url_textformfield;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
