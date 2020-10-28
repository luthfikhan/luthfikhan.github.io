import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;

  const PrimaryButton({Key key, this.onTap, this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      constraints: BoxConstraints(maxWidth: 200, minWidth: 140),
      child: RaisedButton(
        hoverElevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        color: Theme.of(context).accentColor,
        onPressed: onTap,
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
