import 'package:flutter/material.dart';
import 'package:muhammad_ali_portfolio/providers/theme_provider.dart';
import 'package:muhammad_ali_portfolio/widgets/navbar.dart';
import 'package:muhammad_ali_portfolio/sections/hero_section.dart';
import 'package:muhammad_ali_portfolio/sections/about_section.dart';
import 'package:muhammad_ali_portfolio/sections/projects_section.dart';
import 'package:muhammad_ali_portfolio/sections/skills_section.dart';
import 'package:muhammad_ali_portfolio/sections/resume_section.dart';
import 'package:muhammad_ali_portfolio/sections/contact_section.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final List<String> _sectionsNames = ['Home', 'About', 'Projects', 'Skills', 'Resume', 'Contact'];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          ScrollablePositionedList.builder(
            itemCount: 6,
            itemScrollController: itemScrollController,
            itemPositionsListener: itemPositionsListener,
            itemBuilder: (context, index) {
              return SizedBox(
                height: screenSize.height, // Enforce exact height for each section
                width: screenSize.width,
                child: [
                  HeroSection(screenSize: screenSize),
                  AboutSection(screenSize: screenSize),
                  ProjectsSection(screenSize: screenSize),
                  SkillsSection(screenSize: screenSize),
                  ResumeSection(screenSize: screenSize),
                  ContactSection(screenSize: screenSize),
                ][index],
              );
            },
          ),
          Navbar(
            sectionsNames: _sectionsNames,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
              itemScrollController.scrollTo(
                index: index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            toggleTheme: () {
              themeProvider.toggleTheme();
            },
            isDarkMode: themeProvider.isDarkMode,
          ),
        ],
      ),
    );
  }
}