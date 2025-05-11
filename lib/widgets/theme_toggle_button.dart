import 'package:flutter/material.dart';

class ThemeToggleButton extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggle;

  const ThemeToggleButton({
    super.key,
    required this.isDarkMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isDarkMode
              ? Colors.amber.withOpacity(0.2)
              : Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: !isDarkMode ? Colors.blue : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.light_mode,
                size: 16,
                color: !isDarkMode ? Colors.white : Colors.blue,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.amber : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.dark_mode,
                size: 16,
                color: isDarkMode ? Colors.white : Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}