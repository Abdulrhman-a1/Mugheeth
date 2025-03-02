import 'package:flutter/material.dart';
import 'package:graduation/common/widget/drawer/app_bar_items.dart';

class Screen extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final bool? allowDrawer;

  const Screen({
    super.key,
    required this.child,
    this.backgroundColor,
    this.allowDrawer = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: allowDrawer! ? const SideBar() : null,
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
