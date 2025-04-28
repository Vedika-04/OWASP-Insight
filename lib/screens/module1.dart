import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Module1Screen extends StatelessWidget {
  const Module1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A1. Broken Access Control', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                'assets/images/broken.jpg', // Add your Broken Access Control-related image to assets
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('Overview:'),
                  Text(
                    'Broken Access Control occurs when users are able to act outside of their intended permissions. If restrictions on what authenticated users are allowed to do are not properly enforced, attackers can exploit these flaws to access unauthorized functionality or data, such as accessing other users\' accounts, viewing sensitive files, or modifying other users\' data.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Common Examples of Broken Access Control:'),
                  sectionBulletPoints([
                    '• URL tampering to access admin pages. (Eg: Changing /user/profile to /admin/dashboard)',
                    '• Bypassing client-side security controls using tools like Burp Suite.',
                    '• Modifying metadata like tokens or cookies to escalate privileges.',
                    '• Force browsing to authenticated pages without logging in.',
                    '• IDOR (Insecure Direct Object References) vulnerabilities.',
                    '• Elevation of privileges by modifying JWT tokens without validation.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Real-World Scenarios:'),
                  sectionBulletPoints([
                    '• An attacker changes their account ID in the API request to access another user’s account.',
                    '• Accessing admin functionality just by visiting hidden URLs.',
                    '• Unauthorized users gaining access to sensitive files like salary slips, patient records, etc.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Finding Broken Access Control Vulnerabilities:'),
                  sectionBulletPoints([
                    '• Manually test all API endpoints by altering parameters.',
                    '• Try accessing functions without proper authentication.',
                    '• Review application logic for improper permission checks.',
                    '• Use automated vulnerability scanners to detect IDOR and access control flaws.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Prevention Techniques:'),
                  sectionBulletPoints([
                    '1. Deny access by default — allow only what is explicitly permitted.',
                    '2. Enforce server-side access control checks for every request.',
                    '3. Disable web server directory listing and make sure file metadata is protected.',
                    '4. Validate user roles and permissions strictly on the server side.',
                    '5. Use secure frameworks and libraries that provide robust access control mechanisms.',
                    '6. Implement proper session management and strong authorization mechanisms.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Interactive Labs and Resources:'),
                  simpleResourceLink('TryHackMe: Broken Access Control Room - https://tryhackme.com', context),
                  simpleResourceLink('PortSwigger Web Security Academy - Access Control Labs', context),
                  const SizedBox(height: 16),
                  sectionTitle('Watch & Learn:'),
                  simpleResourceLink('Watch: Broken Access Control Explained (YouTube)', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: Colors.black87,
      ),
    );
  }

  TextStyle bodyTextStyle() {
    return const TextStyle(
      fontSize: 18,
      fontFamily: 'Montserrat',
    );
  }

  Widget sectionBulletPoints(List<String> points, {double gap = 10.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points.map((point) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: gap / 2),
          child: Text(
            point,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget simpleResourceLink(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => _showCopyDialog(context, title),
        child: Row(
          children: [
            const Icon(Icons.link, color: Colors.blue),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCopyDialog(BuildContext context, String title) {
    String url = '';
    if (title.contains('YouTube')) {
      url = 'https://www.youtube.com/watch?v=_jz5qFWhLcg'; // Example real YouTube link
    } else if (title.contains('TryHackMe')) {
      url = 'https://tryhackme.com/room/owaspbrokenaccesscontrol'; // Example URL
    } else if (title.contains('PortSwigger')) {
      url = 'https://portswigger.net/web-security/access-control/lab-unprotected-admin-functionality-with-unpredictable-url'; // Example URL
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Copy and Paste URL in Browser'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(url),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: url));
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('URL copied to clipboard!')),
                  );
                },
                child: const Text('Copy URL'),
              ),
            ],
          ),
        );
      },
    );
  }
}