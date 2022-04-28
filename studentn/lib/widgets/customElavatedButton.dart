import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {Key? key,
      required this.buttonText,
      required this.textFontSize,
      required this.textColor,
      required this.buttonBackgroundColor,
      required this.buttonBorderRadius,
      required this.buttonSideColor,
      required this.onPressed})
      : super(key: key);

  final String buttonText;
  final double textFontSize;
  final Color textColor;
  final Color buttonBackgroundColor;
  final double buttonBorderRadius;
  final Color buttonSideColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {

onPressed();

      },
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: textFontSize,
          color: textColor,
        ),
      ),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(buttonBackgroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                  side: BorderSide(color: buttonSideColor)))),
    );
  }
}
