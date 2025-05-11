import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navbar extends StatelessWidget {
  final List<String> sectionsNames;
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const Navbar({
    super.key,
    required this.sectionsNames,
    required this.currentIndex,
    required this.onTap,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isMobile = screenSize.width < 768;

    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: isMobile ? _buildMobileNavbar(context) : _buildDesktopNavbar(context),
    );
  }

  Widget _buildDesktopNavbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.code,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'Muhammad Ali',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              for (int i = 0; i < sectionsNames.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: () => onTap(i),
                    child: Text(
                      sectionsNames[i],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: i == currentIndex ? FontWeight.bold : FontWeight.normal,
                        color: i == currentIndex
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 15),
              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: toggleTheme,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.code,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Muhammad Ali',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: Theme.of(context).iconTheme.color,
                ),
                onPressed: toggleTheme,
              ),
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  _showMobileMenu(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < sectionsNames.length; i++)
                ListTile(
                  title: Text(
                    sectionsNames[i],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: i == currentIndex ? FontWeight.bold : FontWeight.normal,
                      color: i == currentIndex
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onTap(i);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}