// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SkillsSection extends StatelessWidget {
//   final Size screenSize;

//   const SkillsSection({
//     super.key,
//     required this.screenSize,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = screenSize.width < 768;
    
//     return Container(
//       height: screenSize.height,
//       width: screenSize.width,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: 40,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionTitle(context, 'My Skills'),
//           const SizedBox(height: 60),
//           Expanded(
//             child: _buildSkillsGrid(context, isMobile),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSectionTitle(BuildContext context, String title) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: 36,
//             fontWeight: FontWeight.bold,
//             color: Theme.of(context).primaryColor,
//           ),
//         ),
//         const SizedBox(height: 15),
//         Container(
//           width: 80,
//           height: 4,
//           decoration: BoxDecoration(
//             color: Theme.of(context).primaryColor,
//             borderRadius: BorderRadius.circular(2),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildSkillsGrid(BuildContext context, bool isMobile) {
//     final skills = [
//       {
//         'name': 'Flutter',
//         'icon': FontAwesomeIcons.mobileScreen,
//         'level': 0.9,
//         'color': const Color(0xFF02569B),
//       },
//       {
//         'name': 'Dart',
//         'icon': FontAwesomeIcons.code,
//         'level': 0.85,
//         'color': const Color(0xFF0175C2),
//       },
//       {
//         'name': 'JavaScript',
//         'icon': FontAwesomeIcons.js,
//         'level': 0.8,
//         'color': const Color(0xFFF7DF1E),
//       },
//       {
//         'name': 'Node.js',
//         'icon': FontAwesomeIcons.nodeJs,
//         'level': 0.75,
//         'color': const Color(0xFF339933),
//       },
//       {
//         'name': 'C++',
//         'icon': FontAwesomeIcons.cuttlefish,
//         'level': 0.7,
//         'color': const Color(0xFF00599C),
//       },
//       {
//         'name': 'SQL',
//         'icon': FontAwesomeIcons.database,
//         'level': 0.8,
//         'color': const Color(0xFF03A9F4),
//       },
//       {
//         'name': 'Firebase',
//         'icon': FontAwesomeIcons.fire,
//         'level': 0.75,
//         'color': const Color(0xFFFFCA28),
//       },
//       {
//         'name': 'Git',
//         'icon': FontAwesomeIcons.git,
//         'level': 0.8,
//         'color': const Color(0xFFF05032),
//       },
//       {
//         'name': 'Express.js',
//         'icon': FontAwesomeIcons.server,
//         'level': 0.7,
//         'color': const Color(0xFF000000),
//       },
//       {
//         'name': 'MongoDB',
//         'icon': FontAwesomeIcons.database,
//         'level': 0.7,
//         'color': const Color(0xFF47A248),
//       },
//       {
//         'name': 'PostgreSQL',
//         'icon': FontAwesomeIcons.database,
//         'level': 0.7,
//         'color': const Color(0xFF336791),
//       },
//       {
//         'name': 'MySQL',
//         'icon': FontAwesomeIcons.database,
//         'level': 0.8,
//         'color': const Color(0xFF4479A1),
//       },
//     ];

//     return GridView.builder(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: isMobile ? 2 : 4,
//         crossAxisSpacing: 30,
//         mainAxisSpacing: 30,
//         childAspectRatio: 1.0,
//       ),
//       itemCount: skills.length,
//       itemBuilder: (context, index) {
//         final skill = skills[index];
//         return _buildSkillCard(context, skill);
//       },
//     );
//   }

//   Widget _buildSkillCard(BuildContext context, Map<String, dynamic> skill) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardColor,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             skill['icon'] as IconData,
//             size: 40,
//             color: skill['color'] as Color,
//           ),
//           const SizedBox(height: 15),
//           Text(
//             skill['name'] as String,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Theme.of(context).textTheme.bodyLarge?.color,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 15),
//           _buildProgressBar(context, skill['level'] as double, skill['color'] as Color),
//         ],
//       ),
//     );
//   }

//   Widget _buildProgressBar(BuildContext context, double level, Color color) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Proficiency',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.7),
//               ),
//             ),
//             Text(
//               '${(level * 100).toInt()}%',
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).textTheme.bodyLarge?.color,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),
//         Container(
//           height: 6,
//           decoration: BoxDecoration(
//             color: Colors.grey.withOpacity(0.2),
//             borderRadius: BorderRadius.circular(3),
//           ),
//           child: FractionallySizedBox(
//             widthFactor: level,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.circular(3),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends StatelessWidget {
  final Size screenSize;

  const SkillsSection({
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
          _buildSectionTitle(context, 'My Skills'),
          const SizedBox(height: 40),
          Expanded(
            child: _buildSkillsGrid(context, isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: 80,
          height: 4,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsGrid(BuildContext context, bool isMobile) {
    final skills = [
      {
        'name': 'Flutter',
        'icon': FontAwesomeIcons.mobileScreen,
        'level': 0.9,
        'color': const Color(0xFF02569B),
      },
      {
        'name': 'Dart',
        'icon': FontAwesomeIcons.code,
        'level': 0.85,
        'color': const Color(0xFF0175C2),
      },
      {
        'name': 'JavaScript',
        'icon': FontAwesomeIcons.js,
        'level': 0.8,
        'color': const Color(0xFFF7DF1E),
      },
      {
        'name': 'Node.js',
        'icon': FontAwesomeIcons.nodeJs,
        'level': 0.75,
        'color': const Color(0xFF339933),
      },
      {
        'name': 'C++',
        'icon': FontAwesomeIcons.cuttlefish,
        'level': 0.7,
        'color': const Color(0xFF00599C),
      },
      {
        'name': 'SQL',
        'icon': FontAwesomeIcons.database,
        'level': 0.8,
        'color': const Color(0xFF03A9F4),
      },
      {
        'name': 'Firebase',
        'icon': FontAwesomeIcons.fire,
        'level': 0.75,
        'color': const Color(0xFFFFCA28),
      },
      {
        'name': 'Git',
        'icon': FontAwesomeIcons.git,
        'level': 0.8,
        'color': const Color(0xFFF05032),
      },
    
   
      {
        'name': 'PostgreSQL',
        'icon': FontAwesomeIcons.database,
        'level': 0.7,
        'color': const Color(0xFF336791),
      },
      {
        'name': 'MySQL',
        'icon': FontAwesomeIcons.database,
        'level': 0.8,
        'color': const Color(0xFF4479A1),
      },
    ];

    // Calculate how many items to display based on screen size
    // The goal is to show all items without requiring scrolling
    int crossAxisCount = isMobile ? 2 : 4;
    
    // For the grid layout without scrolling
    return Column(
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate dynamic grid parameters
              double availableHeight = constraints.maxHeight;
              double availableWidth = constraints.maxWidth;
              
              // Calculate item dimensions based on available space
              int rowCount = (skills.length / crossAxisCount).ceil();
              double itemHeight = availableHeight / rowCount;
              double itemWidth = availableWidth / crossAxisCount;
              
              // Minimum size to prevent squishing
              double minSize = 100;
              double adjustedSize = (itemHeight < minSize || itemWidth < minSize) 
                  ? minSize 
                  : (itemHeight < itemWidth ? itemHeight : itemWidth);
              
              // Build skills grid
              return Wrap(
                spacing: 20, // horizontal spacing
                runSpacing: 20, // vertical spacing
                alignment: WrapAlignment.center,
                children: List.generate(
                  skills.length,
                  (index) => SizedBox(
                    width: adjustedSize,
                    height: adjustedSize,
                    child: _buildSkillCard(context, skills[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSkillCard(BuildContext context, Map<String, dynamic> skill) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            skill['icon'] as IconData,
            size: 32,
            color: skill['color'] as Color,
          ),
          const SizedBox(height: 10),
          Text(
            skill['name'] as String,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          _buildProgressBar(context, skill['level'] as double, skill['color'] as Color),
        ],
      ),
    );
  }

  Widget _buildProgressBar(BuildContext context, double level, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${(level * 100).toInt()}%',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          height: 4,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(2),
          ),
          child: FractionallySizedBox(
            widthFactor: level,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}