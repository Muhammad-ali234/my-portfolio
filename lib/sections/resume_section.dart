

import 'package:flutter/material.dart';

class ResumeSection extends StatelessWidget {
  final Size screenSize;

  const ResumeSection({
    super.key,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = screenSize.width < 768;

    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : screenSize.width * 0.05, // Reduced horizontal padding
          vertical: screenSize.height * 0.03, // Reduced vertical padding
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'My Resume'),
            const SizedBox(height: 20), // Reduced spacing
            _buildResumeDownloadButton(context),
            const SizedBox(height: 15), // Reduced spacing
            Expanded(
              child: _buildCompactResumeView(context, isMobile),
            ),
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
            fontSize: 28, // Increased from 24
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 8), // Reduced spacing
        Container(
          width: 60, // Reduced width
          height: 3, // Reduced height
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }

  Widget _buildCompactResumeView(BuildContext context, bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Education and Experience in a row for desktop, or stacked for mobile
                  if (isMobile)
                    Expanded(
                    
                      child: Column(
                        children: [
                          Expanded(child: _buildEducationSection(context, true)),
                          const SizedBox(height: 10),
                          Expanded(child: _buildExperienceSection(context, true)),
                        ],
                      ),
                    )
                  else ...[
                    Expanded(child: _buildEducationSection(context, true)),
                    const SizedBox(width: 10),
                    Expanded(child: _buildExperienceSection(context, true)),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: (isMobile)?1:3,
              child: _buildCertificationsSection(context, true),
            ),
          ],
        );
      },
    );
  }

  Widget _buildResumeDownloadButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Download resume action
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Smaller padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.download, size: 16), // Smaller icon
          SizedBox(width: 5),
          Text(
            'Download Resume',
            style: TextStyle(
              fontSize: 14, // Smaller text
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationSection(BuildContext context, bool isCompact) {
    final educationItems = [
      {
        'degree': 'Bachelor of Software Engineering',
        'institution': 'City University of Science & Technology',
        'duration': '2020 - 2024',
        'description': 'Specialized in Dart, JavaScript and modern technologies.',
      },
    ];

    return _buildResumeSection(
      context,
      'Education',
      Icons.school,
      educationItems,
      isCompact,
    );
  }

  Widget _buildExperienceSection(BuildContext context, bool isCompact) {
    final experienceItems = [
      {
        'position': 'Flutter & Node.js Developer',
        'company': 'Freelance',
        'duration': '2024',
        'description': 'Built Vehicle at The Doorstep (VADS) app.',
      },
      {
        'position': 'Flutter Intern',
        'company': 'FF-Steel Peshawar',
        'duration': '2024',
        'description': 'Developed Flutter mobile apps with Provider.',
      },
    ];

    return _buildResumeSection(
      context,
      'Experience',
      Icons.work,
      experienceItems,
      isCompact,
    );
  }

  Widget _buildCertificationsSection(BuildContext context, bool isCompact) {
    final certificationItems = [
      {
        'title': 'Flutter Experience',
        'issuer': 'Flutter',
        'duration': '2023',
        'description': 'Flutter framework and mobile app development.',
      },
      {
        'title': 'JavaScript',
        'issuer': 'JavaScript',
        'duration': '2023',
        'description': 'Advanced JavaScript programming.',
      },
    ];

    return _buildResumeSection(
      context,
      'Certifications',
      Icons.verified,
      certificationItems,
      isCompact,
    );
  }

  Widget _buildResumeSection(
    BuildContext context,
    String title,
    IconData icon,
    List<Map<String, String>> items,
    bool isCompact,
  ) {
    return Container(
      padding: EdgeInsets.all(isCompact ? 15 : 25), // Smaller padding when compact
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 18, // Smaller icon
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20, // Increased from 18
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Reduced spacing
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero, // Remove padding
              children: List.generate(items.length, (index) {
                final item = items[index];
                return _buildCompactResumeItem(
                  context, 
                  item, 
                  index == items.length - 1,
                  isCompact,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompactResumeItem(
    BuildContext context,
    Map<String, String> item,
    bool isLast,
    bool isCompact,
  ) {
    final keys = item.keys.toList();
    final titleKey = keys[0];
    final subtitleKey = keys[1];
    final durationKey = keys[2];
    final descriptionKey = keys[3];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                item[titleKey]!,
                style: TextStyle(
                  fontSize: 16, // Increased from 14
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Smaller padding
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                item[durationKey]!,
                style: const TextStyle(
                  fontSize: 12, // Increased from 10
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 3), // Reduced spacing
        Text(
          item[subtitleKey]!,
          style: TextStyle(
            fontSize: 14, // Increased from 12
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 3), // Reduced spacing
        Text(
          item[descriptionKey]!,
          style: TextStyle(
            fontSize: 13, // Increased from 11
            height: 1.3,
            color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.8),
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (!isLast) ...[
          const SizedBox(height: 8), // Reduced spacing
          Divider(
            color: Theme.of(context).dividerColor,
            height: 8, // Reduced height
          ),
          const SizedBox(height: 8), // Reduced spacing
        ],
      ],
    );
  }
}