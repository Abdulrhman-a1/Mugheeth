import 'package:flutter/material.dart';
import 'package:graduation/common/widget/drawer/app_bar_items.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool? allowDrawer;

  final VoidCallback onClearMessages;

  const Screen({
    super.key,
    required this.child,
    this.backgroundColor,
    this.allowDrawer = true,
    required this.onClearMessages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: allowDrawer!
          ? SideBar(
              onClearMessages: onClearMessages,
            )
          : null,
      body: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xFFB8E1F1).withOpacity(0.08),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFB8E1F1).withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(10, 8),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
