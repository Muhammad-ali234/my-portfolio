// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class ContactSection extends StatefulWidget {
//   final Size screenSize;

//   const ContactSection({
//     super.key,
//     required this.screenSize,
//   });

//   @override
//   State<ContactSection> createState() => _ContactSectionState();
// }

// class _ContactSectionState extends State<ContactSection> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _messageController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }

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
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           final isMobile = constraints.maxWidth < 768;
//           return SingleChildScrollView(
//             child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//             _buildSectionTitle(context, 'Contact Me'),
//             const SizedBox(height: 60),
//             if (isMobile) ...[
//               _buildContactForm(context),
//               const SizedBox(height: 40),
//               _buildContactInfo(context),
//             ] else ...[
//               Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: _buildContactForm(context),
//               ),
//               const SizedBox(width: 40),
//               Expanded(
//                 flex: 2,
//                 child: _buildContactInfo(context),
//               ),
//             ],
//               ),
//             ],
//                     ],
//             ),
//           );
//         },
//       ),
//       );
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

//   Widget _buildContactForm(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(30),
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
//       child: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Send Me a Message',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).textTheme.bodyLarge?.color,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   hintText: 'Enter your name',
//                   prefixIcon: const Icon(Icons.person),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                       color: Theme.of(context).primaryColor,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   hintText: 'Enter your email',
//                   prefixIcon: const Icon(Icons.email),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                       color: Theme.of(context).primaryColor,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: _messageController,
//                 decoration: InputDecoration(
//                   labelText: 'Message',
//                   hintText: 'Enter your message',
//                   prefixIcon: const Icon(Icons.message),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                       color: Theme.of(context).primaryColor,
//                       width: 2,
//                     ),
//                   ),
//                 ),
//                 maxLines: 5,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your message';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // Send message action
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Message sent successfully!'),
//                           backgroundColor: Colors.green,
//                         ),
//                       );
//                       _nameController.clear();
//                       _emailController.clear();
//                       _messageController.clear();
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Theme.of(context).primaryColor,
//                     foregroundColor: Colors.white,
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Text(
//                     'Send Message',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildContactInfo(BuildContext context) {
//     final contactItems = [
//       {
//         'icon': Icons.email,
//         'title': 'Email',
//         'value': 'muhammadali@example.com',
//       },
//       {
//         'icon': Icons.phone,
//         'title': 'Phone',
//         'value': '+1 234 567 890',
//       },
//       {
//         'icon': Icons.location_on,
//         'title': 'Location',
//         'value': 'New York, USA',
//       },
//     ];

//     final socialLinks = [
//       {
//         'icon': FontAwesomeIcons.github,
//         'url': 'https://github.com/Muhammad-ali234',
//         'color': const Color(0xFF333333),
//       },
//       {
//         'icon': FontAwesomeIcons.linkedin,
//         'url': 'https://linkedin.com/in/muhammad-ali',
//         'color': const Color(0xFF0077B5),
//       },
//       {
//         'icon': FontAwesomeIcons.twitter,
//         'url': 'https://twitter.com/muhammad_ali',
//         'color': const Color(0xFF1DA1F2),
//       },
//     ];

//     return Container(
//       padding: const EdgeInsets.all(30),
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
//             'Contact Information',
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               color: Theme.of(context).textTheme.bodyLarge?.color,
//             ),
//           ),
//           const SizedBox(height: 20),
//           ...contactItems.map((item) => _buildContactItem(context, item)),
//           const SizedBox(height: 30),
//           Text(
//             'Social Links',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Theme.of(context).textTheme.bodyLarge?.color,
//             ),
//           ),
//           const SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: socialLinks.map((link) => _buildSocialLink(context, link)).toList(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildContactItem(BuildContext context, Map<String, dynamic> item) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Icon(
//               item['icon'] as IconData,
//               size: 24,
//               color: Theme.of(context).primaryColor,
//             ),
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item['title'] as String,
//                   style: TextStyle(
//                     fontSize: 16,
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

//   Widget _buildSocialLink(BuildContext context, Map<String, dynamic> link) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 15),
//       child: InkWell(
//         onTap: () {
//           // Open social link
//         },
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Theme.of(context).brightness == Brightness.dark
//                 ? link['color'] as Color
//                 : (link['color'] as Color).withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(
//             link['icon'] as IconData,
//             size: 20,
//             color: Theme.of(context).brightness == Brightness.dark
//                 ? Colors.white
//                 : link['color'] as Color,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  final Size screenSize;

  const ContactSection({
    super.key,
    required this.screenSize,
  });

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.screenSize.height,
      width: widget.screenSize.width,
      padding: EdgeInsets.symmetric(
        horizontal: widget.screenSize.width < 768 ? 20 : 80,
        vertical: 40,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle(context, 'Contact Me', isMobile),
                const SizedBox(height: 40),
                isMobile
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
                const SizedBox(height: 20), // Bottom padding
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isMobile ? 32 : 36,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 10),
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

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactForm(context, true),
        const SizedBox(height: 30),
        _buildContactInfo(context, true),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _buildContactForm(context, false),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: _buildContactInfo(context, false),
        ),
      ],
    );
  }

  Widget _buildContactForm(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
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
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send Me a Message',
              style: TextStyle(
                fontSize: isMobile ? 20 : 22,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                hintText: 'Enter your name',
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Message',
                hintText: 'Enter your message',
                prefixIcon: const Icon(Icons.message),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              maxLines: isMobile ? 4 : 5,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Message sent successfully!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    _nameController.clear();
                    _emailController.clear();
                    _messageController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Send Message',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context, bool isMobile) {
    final contactItems = [
      {
        'icon': Icons.email,
        'title': 'Email',
        'value': 'muhammadali.chd12@gmail.com',
      },
      {
        'icon': Icons.phone,
        'title': 'Phone',
        'value': '+923184439061',
      },
      {
        'icon': Icons.location_on,
        'title': 'Location',
        'value': 'Islamabad, Pakistan',
      },
    ];

    final socialLinks = [
      {
        'icon': FontAwesomeIcons.github,
        'url': 'https://github.com/Muhammad-ali234',
        'color': const Color(0xFF333333),
      },
      {
        'icon': FontAwesomeIcons.linkedin,
        'url': 'https://linkedin.com/in/muhammad-ali',
        'color': const Color(0xFF0077B5),
      },
      {
        'icon': FontAwesomeIcons.twitter,
        'url': 'https://twitter.com/muhammad_ali',
        'color': const Color(0xFF1DA1F2),
      },
    ];

    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 30),
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
            'Contact Information',
            style: TextStyle(
              fontSize: isMobile ? 20 : 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: contactItems
                .map((item) => _buildContactItem(context, item, isMobile))
                .toList(),
          ),
          SizedBox(height: isMobile ? 20 : 30),
          Text(
            'Social Links',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: socialLinks
                .map((link) => _buildSocialLink(context, link, isMobile))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
      BuildContext context, Map<String, dynamic> item, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 250,
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              item['icon'] as IconData,
              size: isMobile ? 20 : 24,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'] as String,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  item['value'] as String,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 14,
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color
                        ?.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLink(
      BuildContext context, Map<String, dynamic> link, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () async {
          final url = link['url'] as String;
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url));
          }
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? link['color'] as Color
                : (link['color'] as Color).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            link['icon'] as IconData,
            size: isMobile ? 18 : 20,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : link['color'] as Color,
          ),
        ),
      ),
    );
  }
}