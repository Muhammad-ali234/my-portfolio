import 'package:flutter/material.dart';

class SocialButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.color
              : Theme.of(context).brightness == Brightness.dark
                  ? widget.color.withOpacity(0.2)
                  : widget.color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          widget.icon,
          size: 20,
          color: _isHovered
              ? Colors.white
              : Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : widget.color,
        ),
      ),
    );
  }
}