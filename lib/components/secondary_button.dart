import 'package:flutter/material.dart';
import 'package:flutter_web/constans.dart';

class SecondaryButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;

  const SecondaryButton({Key key, this.onTap, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      constraints: BoxConstraints(maxWidth: 200, minWidth: 140),
      child: RaisedButton(
        hoverElevation: 10,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: fontColor),
            borderRadius: BorderRadius.circular(60)),
        onPressed: onTap,
        color: Colors.transparent,
        focusColor: Colors.white,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
