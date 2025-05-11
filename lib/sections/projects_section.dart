

// import 'package:flutter/material.dart';

// class ProjectsSection extends StatefulWidget {
//   final Size screenSize;

//   const ProjectsSection({
//     super.key,
//     required this.screenSize,
//   });

//   @override
//   State<ProjectsSection> createState() => _ProjectsSectionState();
// }

// class _ProjectsSectionState extends State<ProjectsSection> {
//   final List<Map<String, dynamic>> _projects = [
//     {
//       'title': 'E-Drawer',
//       'description': 'Developed a multi-vendor Flutter marketplace featuring admin and seller dashboards, voice search, and real-time chat.',
//       'image': 'https://images.pexels.com/photos/230544/pexels-photo-230544.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//       'technologies': ['Flutter', 'Node.js', 'MySQL', 'JWT'],
//       'github': 'https://github.com/Muhammad-ali234/E-Drawer',
//       'demo': 'https://e-drawer-demo.web.app',
//     },
//     {
//       'title': 'VADS',
//       'description': 'Flutter app connecting buyers with sellers and drivers for test drives at home. Features include Provider for state management and Socket.io for real-time chat.',
//       'image': 'https://images.pexels.com/photos/3243/pen-calendar-to-do-checklist.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//       'technologies': ['Flutter', 'Node.js', 'MySQL', 'Socket.io'],
//       'github': 'https://github.com/Muhammad-ali234/VADS',
//       'demo': 'https://vads-demo.web.app',
//     },
//     {
//       'title': 'FFMS',
//       'description': 'Built a comprehensive Flutter Windows desktop application for fast food management, including dashboard metrics, order management, and inventory tracking.',
//       'image': 'https://images.pexels.com/photos/1118873/pexels-photo-1118873.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
//       'technologies': ['Flutter', 'Dart', 'PostgreSQL'],
//       'github': 'https://github.com/Muhammad-ali234/FFMS',
//       'demo': 'https://ffms-demo.web.app',
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = widget.screenSize.width < 768;

//     return Container(
//       height: widget.screenSize.height,
//       width: widget.screenSize.width,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 20 : 80,
//         vertical: 40,
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildSectionTitle(context, 'My Projects'),
//           const SizedBox(height: 60),
//           Expanded(
//             child: isMobile
//                 ? _buildMobileProjectsView(context)
//                 : _buildDesktopProjectsView(context),
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

//   Widget _buildMobileProjectsView(BuildContext context) {
//     return SizedBox(
//       height: widget.screenSize.height - 100 - 60, // Adjust for title and padding
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: _projects.map((project) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 20),
//               child: _buildProjectCard(context, project, true),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildDesktopProjectsView(BuildContext context) {
//     return SizedBox(
//       height: widget.screenSize.height - 100 - 60, // Adjust for title and padding
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: _projects.map((project) {
//             return Padding(
//               padding: const EdgeInsets.only(right: 30),
//               child: _buildProjectCard(context, project, false),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildProjectCard(BuildContext context, Map<String, dynamic> project, bool isMobile) {
//     return Container(
//       width: isMobile ? 300.0 : 400.0, // Fixed width for each card
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
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(15),
//               topRight: Radius.circular(15),
//             ),
//             child: Image.network(
//               project['image'] as String,
//               height: isMobile ? 200 : 150,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   project['title'] as String,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Theme.of(context).textTheme.bodyLarge?.color,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   project['description'] as String,
//                   maxLines: isMobile ? 3 : 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 14,
//                     height: 1.5,
//                     color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Wrap(
//                   spacing: 8,
//                   runSpacing: 8,
//                   children: (project['technologies'] as List<String>).map((tech) {
//                     return Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                       decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColor.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Text(
//                         tech,
//                         style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).primaryColor,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 15),
//                 Row(
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         // Open GitHub link
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Theme.of(context).primaryColor,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                       child: const Text(
//                         'GitHub',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     OutlinedButton(
//                       onPressed: () {
//                         // Open Demo link
//                       },
//                       style: OutlinedButton.styleFrom(
//                         foregroundColor: Theme.of(context).primaryColor,
//                         side: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
//                         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                       ),
//                       child: const Text(
//                         'Live Demo',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
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

class ProjectsSection extends StatefulWidget {
  final Size screenSize;

  const ProjectsSection({
    super.key,
    required this.screenSize,
  });

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final List<Map<String, dynamic>> _projects = [
    {
      'title': 'E-Drawer',
      'description': 'Developed a multi-vendor Flutter marketplace featuring admin and seller dashboards, voice search, and real-time chat.',
      'image': 'https://images.pexels.com/photos/230544/pexels-photo-230544.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'technologies': ['Flutter', 'Node.js', 'MySQL', 'JWT'],
      'github': 'https://github.com/Muhammad-ali234/E-Drawer',
      'demo': 'https://e-drawer-demo.web.app',
    },
    {
      'title': 'VADS',
      'description': 'Flutter app connecting buyers with sellers and drivers for test drives at home. Features include Provider for state management and Socket.io for real-time chat.',
      'image': 'https://images.pexels.com/photos/3243/pen-calendar-to-do-checklist.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'technologies': ['Flutter', 'Node.js', 'MySQL', 'Socket.io'],
      'github': 'https://github.com/Muhammad-ali234/VADS',
      'demo': 'https://vads-demo.web.app',
    },
    {
      'title': 'FFMS',
      'description': 'Built a comprehensive Flutter Windows desktop application for fast food management, including dashboard metrics, order management, and inventory tracking.',
      'image': 'https://images.pexels.com/photos/1118873/pexels-photo-1118873.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
      'technologies': ['Flutter', 'Dart', 'PostgreSQL'],
      'github': 'https://github.com/Muhammad-ali234/FFMS',
      'demo': 'https://ffms-demo.web.app',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = widget.screenSize.width < 768;

    return Container(
      height: widget.screenSize.height,
      width: widget.screenSize.width,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(context, 'My Projects'),
          const SizedBox(height: 40), // Reduced from 60 to save space
          Expanded(
            child: isMobile
                ? _buildMobileProjectsView(context)
                : _buildDesktopProjectsView(context),
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

  Widget _buildMobileProjectsView(BuildContext context) {
    // Calculate available height more accurately
    final double titleHeight = 36 + 15 + 4; // Text height + spacing + underline
    final double verticalPadding = 40 * 2; // Top and bottom padding
    final double topSpacing = 40; // SizedBox height after title
    final double availableHeight = widget.screenSize.height - titleHeight - verticalPadding - topSpacing;

    return SizedBox(
      height: availableHeight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _projects.map((project) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: _buildProjectCard(context, project, true, availableHeight),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildDesktopProjectsView(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _projects.map((project) {
            return Padding(
              padding: const EdgeInsets.only(right: 30),
              child: _buildProjectCard(context, project, false, null),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Map<String, dynamic> project, bool isMobile, double? maxHeight) {
    // For mobile, set a max height constraint
    final double cardWidth = isMobile ? 300.0 : 400.0;
    final double imageHeight = isMobile ? 150 : 150; // Reduced image height for mobile

    return Container(
      width: cardWidth,
      constraints: maxHeight != null ? BoxConstraints(maxHeight: maxHeight) : null,
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
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              project['image'] as String,
              height: imageHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project['title'] as String,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      project['description'] as String,
                      maxLines: isMobile ? 3 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (project['technologies'] as List<String>).map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tech,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Open GitHub link
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'GitHub',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {
                            // Open Demo link
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Live Demo',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}