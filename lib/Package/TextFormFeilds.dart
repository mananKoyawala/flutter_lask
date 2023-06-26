// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:flutter/material.dart';

import 'Constants.dart';

class TextFFeild extends StatelessWidget {
  final TextInputType textInputType;
  final Color mainColor;
  final int? length;
  final String? labelText;
  final String? hintText;
  final String? defaultText;
  final String? parameterValidate;
  final bool obsecureText;
  final bool focus;
  final TextEditingController? controller;
  final TextInputAction action;
  final FocusNode? focusNode;
  final String? Function(String?) funValidate;
  // final Function(String?) onFieldSubmitted;
  final VoidCallback? onSubmitField;
  final Function? onFieldTap;
  final Widget? prifixIcon;
  final double borderRadius;
  final Color? labelColor;
  final Widget? suffixIconData;
  final String? initialValue;
  final int? maxLines;
  final bool? readOnly;
  final bool border;
  final bool? showCursor;
  final TextInputAction? textInputAction;
  final TextStyle hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  const TextFFeild({
    super.key,
    this.maxLines,
    required this.focus,
    this.initialValue,
    required this.mainColor,
    this.labelText,
    this.length,
    required this.textInputType,
    this.hintText,
    this.defaultText,
    this.parameterValidate,
    required this.obsecureText,
    this.controller,
    this.focusNode,
    required this.funValidate,
    required this.borderRadius,
    this.onSubmitField,
    this.onFieldTap,
    this.prifixIcon,
    this.labelColor,
    this.suffixIconData,
    this.action = TextInputAction.next,
    this.readOnly,
    required this.border,
    required this.hintStyle,
    this.showCursor,
    this.textInputAction,
    this.contentPadding,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    double bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    return TextFormField(
        readOnly: readOnly ?? false,
        initialValue: initialValue,
        autofocus: focus,
        textInputAction: textInputAction,
        showCursor: showCursor,
        controller: controller,
        validator: funValidate,
        focusNode: focusNode,
        cursorColor: mainColor,
        obscureText: obsecureText,
        keyboardType: textInputType,
        scrollPadding: EdgeInsets.only(bottom: bottomInsets + 65.0),
        onChanged: onChanged,
        maxLines: maxLines,
        onEditingComplete: onSubmitField,
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: black),
        maxLength: length,
        decoration: InputDecoration(
          suffixIcon: suffixIconData,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          counterText: "",
          labelText: labelText,

          // prefixIcon: prifixIcon,
          // filled: true,
          // prefix: prifixIcon,
          prefixIcon: prifixIcon,
          errorStyle: TextStyle(fontSize: 14),
          // prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          labelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: border == false
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          focusedBorder: border == false
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
          border: border == false
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
        ));
  }
}

class InitialTextFFeild extends StatelessWidget {
  final TextInputType textInputType;
  final Color mainColor;
  final int? length;
  final String? labelText;
  final String? hintText;
  final String? defaultText;
  final String? parameterValidate;
  final bool obsecureText;
  final bool focus;
  final TextEditingController? controller;
  final TextInputAction action;
  final FocusNode? focusNode;
  final String? Function(String?) funValidate;
  // final Function(String?) onFieldSubmitted;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final Widget? prifixIcon;
  final double borderRadius;
  final Color? labelColor;
  final Widget? suffixIconData;
  final String? initialValue;
  final int? maxLines;
  final bool? readOnly;
  final bool border;
  final bool? showCursor;
  final TextInputAction? textInputAction;
  final TextStyle hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  const InitialTextFFeild({
    super.key,
    this.maxLines,
    required this.focus,
    this.initialValue,
    required this.mainColor,
    this.labelText,
    this.length,
    required this.textInputType,
    this.hintText,
    this.defaultText,
    this.parameterValidate,
    required this.obsecureText,
    this.controller,
    this.focusNode,
    required this.funValidate,
    required this.borderRadius,
    this.onSubmitField,
    this.onFieldTap,
    this.prifixIcon,
    this.labelColor,
    this.suffixIconData,
    this.action = TextInputAction.next,
    this.readOnly,
    required this.border,
    required this.hintStyle,
    this.showCursor,
    this.textInputAction,
    this.contentPadding,
    this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    double bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    return TextFormField(
        readOnly: readOnly ?? false,
        initialValue: initialValue,
        autofocus: false,
        textInputAction: textInputAction,
        // controller: controller,
        validator: funValidate,
        cursorColor: mainColor,
        obscureText: obsecureText,
        keyboardType: textInputType,
        scrollPadding: EdgeInsets.only(bottom: bottomInsets + 65.0),
        onChanged: onChanged,
        style:
            TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: black),
        maxLength: length,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          counterText: "",
          labelText: labelText,

          // prefixIcon: prifixIcon,
          // filled: true,
          // prefix: prifixIcon,
          errorStyle: TextStyle(fontSize: 14),
          // prefixIcon: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
          labelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: border == false
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
          focusedBorder: border == false
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
          border: border == false
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                )
              : OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(borderRadius))),
        ));
  }
}
