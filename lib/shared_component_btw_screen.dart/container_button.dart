import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final Title;

  Function submit;
  Color color;
  Color txtColor;

  ContainerButton({
    required this.color,
    required this.txtColor,
    required this.Title,
    required this.submit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => submit(),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        color: color,
        child: Text(
          Title,
          style: TextStyle(
              color: txtColor, fontWeight: FontWeight.bold, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
