import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  final Size screenSize;

  const HeroSection({
    super.key,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = screenSize.width < 768;
    
    return Container(
      height: screenSize.height,
      width: screenSize.width,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isMobile) ...[
            _buildProfileImage(context, 150),
            const SizedBox(height: 30),
            _buildContent(context, isMobile),
          ] else ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: _buildContent(context, isMobile),
                ),
                Expanded(
                  flex: 2,
                  child: _buildProfileImage(context, 280),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context, double size) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 5,
          ),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
          image: const DecorationImage(
            image:AssetImage('assets/images/57.png'), 
            // NetworkImage('https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hello, I\'m',
          style: TextStyle(
            fontSize: isMobile ? 18 : 24,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Muhammad Ali',
          style: TextStyle(
            fontSize: isMobile ? 40 : 60,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Text(
              'I\'m a ',
              style: TextStyle(
                fontSize: isMobile ? 20 : 28,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Flutter Developer',
                  textStyle: TextStyle(
                    fontSize: isMobile ? 20 : 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Web Designer',
                  textStyle: TextStyle(
                    fontSize: isMobile ? 20 : 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  'Software Engineer',
                  textStyle: TextStyle(
                    fontSize: isMobile ? 20 : 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 3,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ],
        ),
        const SizedBox(height: 25),
        SizedBox(
          width: isMobile ? screenSize.width : screenSize.width * 0.4,
          child: Text(
            'Passionate about creating beautiful, functional, and user-friendly applications using Flutter, Dart, Python, and C++.',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              height: 1.5,
              color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // Scroll to contact section
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Hire Me',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 20),
            OutlinedButton(
              onPressed: () {
                // Scroll to projects section
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
                side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'My Work',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}