import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class CustomButtom extends StatelessWidget {
  final VoidCallback callback;
  final String text;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double height;
  final double width;
  final double fontSize;
  final Color textColor;
  final String iconImagePath;

  const CustomButtom({
    @required this.callback,
    @required this.text,
    @required this.marginLeft,
    @required this.marginRight,
    @required this.marginTop,
    @required this.height,
    this.width,
    @required this.fontSize,
    @required this.textColor,
    this.iconImagePath
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        margin: EdgeInsets.only(left: marginLeft, right: marginRight, top: marginTop),
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6.0, // soften the shadow
              spreadRadius: 2.0, //extend the shadow
            )
          ],
          color: ColorConstants.colorSecondaryBlue,
          borderRadius: BorderRadius.all(Radius.circular(35.0))
        ),
        child: iconImagePath == null ?
        Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize
          ),
        ) :
        Row(
          children: <Widget>[

            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(left: 30.0, right: 10.0),
                height: 45.0,
                width: 45.0,
                child: Image.asset(iconImagePath),
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  text,
                  style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}