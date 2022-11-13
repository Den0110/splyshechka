import 'package:flutter/material.dart';

class ActiveWidget extends StatelessWidget {
  const ActiveWidget({
    super.key,
    required this.isActive,
    this.onTap,
    required this.child,
  });

  final bool isActive;
  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? InkWell(
            onTap: onTap,
            child: child,
          )
        : IgnorePointer(
            child: Opacity(
              opacity: 0.4,
              child: child,
            ),
          );
  }
}
