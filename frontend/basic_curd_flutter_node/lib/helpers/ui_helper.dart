import 'package:flutter/material.dart';

class UiHelper{

 Widget dynamicTextFormField({
    required String hintText,
    required String labelText,
    required IconData prefixIcon,
    String? initialValue,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      cursorColor: Colors.white,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      initialValue: initialValue,
      validator: validator,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        floatingLabelStyle: TextStyle(color: Colors.white),
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        filled: true,
        fillColor: Colors.grey.shade700,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    );
  }

}