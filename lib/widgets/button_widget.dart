import 'package:flutter/material.dart';

class DownButton extends StatefulWidget {
  final String buttonText;
  final Color selectedColor;
  const DownButton(this.buttonText, this.selectedColor);

  @override
  _DownButtonState createState() => _DownButtonState();
}

class _DownButtonState extends State<DownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //  width: (MediaQuery.of(context).size.width)-103,
      width: ((MediaQuery.of(context).size.width) / 2) - 10,
      height: 45,
      decoration: BoxDecoration(
          color: widget.selectedColor ,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
              color: Colors.black54, width: 1, style: BorderStyle.solid)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          widget.buttonText,
          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
