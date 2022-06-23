import 'package:component/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomInputText extends StatefulWidget {
  final String? hintText;
  final TextInputType? inputType;
  final TextEditingController controller;
  final bool passwordMode;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChanged;
  final bool autoValid;
  final Widget? preffixWidget;
  final int? maxLines;

  const CustomInputText(
      {Key? key,
      required this.controller,
      this.inputType,
      this.hintText,
      this.validator,
      this.onChanged,
      this.autoValid = false,
      this.passwordMode = false,
      this.preffixWidget,
      this.maxLines})
      : super(key: key);

  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  bool _passwordInVisible = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: kGreyColor,
      child: TextFormField(
        maxLines: widget.maxLines ?? 1,
        controller: widget.controller,
        // ignore: prefer_if_null_operators

        keyboardType: widget.inputType ?? TextInputType.text,
        autovalidateMode:
            widget.autoValid ? AutovalidateMode.onUserInteraction : null,
        obscureText: widget.passwordMode ? _passwordInVisible : false,
        validator: widget.validator,
        onChanged: widget.onChanged,
        style: blackTextStyle.copyWith(fontSize: 16, fontWeight: regular),
        decoration: InputDecoration(
          fillColor: kWhiteColor,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          hintText: widget.hintText == null ? "" : widget.hintText!,
          hintStyle: greyTextStyle.copyWith(fontSize: 16, fontWeight: regular),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: kGreyColor, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: kGreyColor, width: 0.5),
          ),
          prefixIcon: widget.preffixWidget ?? const SizedBox(),
          suffixIcon: widget.passwordMode
              ? IconButton(
                  icon: Icon(
                    _passwordInVisible
                        ? Icons.visibility_off
                        : Icons.visibility, //change icon based on boolean value
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordInVisible =
                          !_passwordInVisible; //change boolean value
                    });
                  },
                )
              : null,
          errorStyle: const TextStyle(
            fontSize: 10.0,
          ),
          errorMaxLines: 4,
        ),
      ),
    );
  }
}
