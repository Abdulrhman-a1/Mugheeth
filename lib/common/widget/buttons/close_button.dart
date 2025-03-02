import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  final VoidCallback? onDialogClosed;

  const ExitButton({
    Key? key,
    this.onDialogClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(18), // Simplified radius
        minSize: 36,
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          onDialogClosed?.call(); // Safely call the callback if provided
        },
      ),
    );
  }
}