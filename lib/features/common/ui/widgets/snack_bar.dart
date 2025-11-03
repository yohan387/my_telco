import 'package:flutter/material.dart';
import 'package:my_telco/core/constants/style.dart';

void showTopLeftSnackBar({
  required BuildContext context,
  required Widget icon,
  required String message,

  Duration duration = const Duration(seconds: 3),
}) {
  final overlay = Overlay.of(context);

  final overlayEntry = OverlayEntry(
    builder: (context) {
      final topSafeArea = MediaQuery.of(context).padding.top + 74;
      return Positioned(
        top: topSafeArea,
        left: 16,
        child: Material(
          color: Colors.transparent,
          child: _TopLeftSnackbar(
            child: _SnackBarContent(icon: icon, message: message),
          ),
        ),
      );
    },
  );

  overlay.insert(overlayEntry);

  Future.delayed(duration, () {
    overlayEntry.remove();
  });
}

class _TopLeftSnackbar extends StatefulWidget {
  final Widget child;
  const _TopLeftSnackbar({required this.child});

  @override
  State<_TopLeftSnackbar> createState() => _TopLeftSnackbarState();
}

class _TopLeftSnackbarState extends State<_TopLeftSnackbar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _offsetAnimation, child: widget.child);
  }
}

class _SnackBarContent extends StatelessWidget {
  final Widget icon;
  final String message;

  const _SnackBarContent({required this.icon, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.normal),
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            blurRadius: 16,
            offset: Offset(2, 2),
            spreadRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
