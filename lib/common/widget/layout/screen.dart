import 'package:flutter/material.dart';
import 'package:graduation/common/widget/drawer/app_bar_items.dart';
import 'package:graduation/data/auth/service/auth_service.dart';

class Screen extends StatefulWidget {
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
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: authService.userNameNotifier,
      builder: (context, userName, _) {
        final bool isAuthenticated = userName != null && userName.isNotEmpty;

        return Scaffold(
          resizeToAvoidBottomInset: true,
          drawer: widget.allowDrawer!
              ? SideBar(
                  onClearMessages: widget.onClearMessages,
                )
              : null,
          drawerEnableOpenDragGesture: isAuthenticated,
          body: Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor ??
                  const Color(0xFFB8E1F1).withOpacity(0.08),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFB8E1F1).withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: const Offset(10, 8),
                ),
              ],
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
