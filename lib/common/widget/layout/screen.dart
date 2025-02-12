import 'package:flutter/material.dart';
import 'package:graduation/common/drawer/app_bar_items.dart';

/// Default app screen that has a shadow
class Screen extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const Screen({super.key, required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBar(),
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
