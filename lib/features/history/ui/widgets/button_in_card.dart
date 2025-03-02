import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final Color buttonColor;

  const CardButton({Key? key, required this.buttonColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: Icon(Icons.remove_red_eye_outlined, color: buttonColor),
          label: Text(
            'عرض المزيد',
            style: TextStyle(color: buttonColor),
          ),
        ),
      ],
    );
  }
}
