import 'package:flutter/material.dart';


class CustomTextFieldWidget extends StatelessWidget{

  const CustomTextFieldWidget({Key? key, required this.Controller, required this.validator, required this.keyboardType, required this.textfieldHint, required this.textfieldIcon, required this.ispasswordField, required this.obscureText}) : super (key: key);

  final TextEditingController Controller;
  final String? Function(String?) validator ;
  final TextInputType keyboardType ;
  final String textfieldHint;
  final Widget textfieldIcon;
  final bool ispasswordField;
  final bool obscureText ;

  @override
  Widget build(BuildContext context) {
    return

    Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextFormField(
        cursorColor: Color(0xff6C63FF),
        obscuringCharacter: '*',
        obscureText: obscureText,
        validator: validator,
        controller: Controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffF4F4F4),
          hintText: textfieldHint,
          prefixIcon:textfieldIcon,
          prefixIconColor:  Color(0xff6C63FF),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Color(0xffF4F4F4),
                width: 3,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Color(0xff6C63FF),
                width: 3,
              )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red.shade600,
                width: 3,
              )
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red.shade600,
                width: 3,
              )
          ),
        ),

      ),
    )
    ;
  }
}