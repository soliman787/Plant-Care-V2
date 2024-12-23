import 'package:flutter/material.dart';
import 'package:plant_care_ut/core/utils/styles.dart';

import '../../../../../generated/l10n.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key, required this.hint,  required this.passwordField, required this.icon, this.onChanged,
  });
  final String hint;
  final bool passwordField;
  final String icon;
  final Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return S.of(context).FieldIsRequired;
        }
        else{
          return null;
        }
      },
      onChanged: widget.onChanged,
      style: const TextStyle(color: Colors.white),
      obscureText: widget.passwordField == true ? _obscureText :false,
      decoration: InputDecoration(

          hintText: widget.hint,
          hintStyle: Styles.styleMediumLeagueSpartan16
              .copyWith(color: const Color(0xFF6F706F)),
          prefixIcon: Image.asset(widget.icon),
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon:
            widget.passwordField==true? Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: _obscureText == false ? Colors.blue : Colors.grey,) : Text(""),
          )
      ),
    );
  }
}
