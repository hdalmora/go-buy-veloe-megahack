import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class CustomFieldText extends StatelessWidget {
  final Key key;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final TextInputType textInputType;
  final String hintText;
  final bool obscured;
  final void Function(void) onChanged;
  final String errorText;
  final IconData prefixIcon;

  const CustomFieldText({
    this.key,
    @required this.obscured,
    @required this.marginLeft,
    @required this.marginRight,
    @required this.marginTop,
    @required this.textInputType,
    @required this.hintText,
    this.prefixIcon,
    this.onChanged,
    this.errorText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft, right: marginRight, top: marginTop),
      child: TextField(
        key: key,
        onChanged: onChanged,
        keyboardType: textInputType,
        obscureText: obscured,
        style: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, size: 25.0, color: Colors.black38,),
          errorText: errorText,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(35.0))
          ),
          fillColor: ColorConstants.colorWhiteFA,
          hintText: hintText,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black38
          ),
          labelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black38
          ),
        ),
      ),
    );
  }
}