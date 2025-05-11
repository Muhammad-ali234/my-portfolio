// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class AboutSection extends StatelessWidget {
//   final Size screenSize;

//   const AboutSection({
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
//           _buildSectionTitle(context, 'About Me'),
//           const SizedBox(height: 60),
//           if (isMobile) ...[
//             _buildAboutContent(context),
//           ] else ...[
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 3,
//                   child: _buildAboutContent(context),
//                 ),
//                 const SizedBox(width: 40),
//                 Expanded(
//                   flex: 2,
//                   child: _buildPersonalInfo(context),
//                 ),
//               ],
//             ),
//           ],
//           if (isMobile) ...[
//             const SizedBox(height: 40),
//             _buildPersonalInfo(context),
//           ],
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

//   Widget _buildAboutContent(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Who am I?',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Theme.of(context).textTheme.bodyLarge?.color,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'Application developer with expertise in building Flutter mobile applications, Node.js backends, and full-stack solutions. Proficient in both frontend and backend development, including UI design, server-side logic, database integration, and API development.',
//             style: TextStyle(
//               fontSize: 16,
//               height: 1.8,
//               color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
//             ),
//           ),
//           const SizedBox(height: 20),
//           Text(
//             'Passionate about writing clean, maintainable, and efficient code following industry best practices. Specialized in Dart, JavaScript and modern technologies like Flutter and Node.js.',
//             style: TextStyle(
//               fontSize: 16,
//               height: 1.8,
//               color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Download CV action
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Theme.of(context).primaryColor,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: const [
//                     Icon(Icons.download, size: 18),
//                     SizedBox(width: 8),
//                     Text(
//                       'Download CV',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPersonalInfo(BuildContext context) {
//     final infoItems = [
//       {'icon': Icons.person, 'label': 'Name', 'value': 'Muhammad Ali'},
//       {'icon': Icons.email, 'label': 'Email', 'value': 'muhammadali.chd12@gmail.com'},
//       {'icon': Icons.phone, 'label': 'Phone', 'value': '+923184439061'},
//       {'icon': Icons.location_on, 'label': 'Location', 'value': 'Islamabad, Pakistan'},
//       {'icon': FontAwesomeIcons.github, 'label': 'GitHub', 'value': 'github.com/Muhammad-ali234'},
//     ];

//     return Container(
//       padding: const EdgeInsets.all(25),
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
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Personal Information',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Theme.of(context).textTheme.bodyLarge?.color,
//             ),
//           ),
//           const SizedBox(height: 20),
//           ...infoItems.map((item) => _buildInfoItem(context, item)),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoItem(BuildContext context, Map<String, dynamic> item) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(
//             item['icon'] as IconData,
//             size: 20,
//             color: Theme.of(context).primaryColor,
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item['label'] as String,
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).textTheme.bodyLarge?.color,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   item['value'] as String,
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutSection extends StatelessWidget {
  final Size screenSize;

  const AboutSection({
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'About Me'),
            const SizedBox(height: 60),
            if (isMobile) ...[
              _buildAboutContent(context),
              const SizedBox(height: 40),
              _buildPersonalInfo(context),
            ] else ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildAboutContent(context),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 2,
                    child: _buildPersonalInfo(context),
                  ),
                ],
              ),
            ],
            // Add extra padding at the bottom to ensure content is fully visible
            const SizedBox(height: 20),
          ],
        ),
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

  Widget _buildAboutContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Who am I?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Application developer with expertise in building Flutter mobile applications, Node.js backends, and full-stack solutions. Proficient in both frontend and backend development, including UI design, server-side logic, database integration, and API development.',
          style: TextStyle(
            fontSize: 16,
            height: 1.8,
            color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Passionate about writing clean, maintainable, and efficient code following industry best practices. Specialized in Dart, JavaScript and modern technologies like Flutter and Node.js.',
          style: TextStyle(
            fontSize: 16,
            height: 1.8,
            color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // Download CV action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.download, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'Download CV',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPersonalInfo(BuildContext context) {
    final infoItems = [
      {'icon': Icons.person, 'label': 'Name', 'value': 'Muhammad Ali'},
      {'icon': Icons.email, 'label': 'Email', 'value': 'muhammadali.chd12@gmail.com'},
      {'icon': Icons.phone, 'label': 'Phone', 'value': '+923184439061'},
      {'icon': Icons.location_on, 'label': 'Location', 'value': 'Islamabad, Pakistan'},
      {'icon': FontAwesomeIcons.github, 'label': 'GitHub', 'value': 'github.com/Muhammad-ali234'},
    ];

    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 20),
          ...infoItems.map((item) => _buildInfoItem(context, item)),
        ],
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            item['icon'] as IconData,
            size: 20,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['label'] as String,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item['value'] as String,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}