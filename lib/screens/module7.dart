import 'package:flutter/material.dart';

class Module7Screen extends StatelessWidget {
  const Module7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A07. Identification and Authentication Failures', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/iaf.jpg', // Make sure this image is available in assets
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('Overview:'),
                  Text(
                    'Identification and authentication failures occur when authentication mechanisms are implemented poorly or bypassed, allowing unauthorized users to access sensitive systems or data.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'These flaws can result in account takeovers, unauthorized access, and identity theft.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Common Causes:'),
                  sectionBulletPoints([
                    '1. Poor password policies or weak credentials.',
                    '2. Insecure password recovery mechanisms.',
                    '3. Credential stuffing vulnerabilities.',
                    '4. Missing or improperly implemented multi-factor authentication (MFA).',
                    '5. Session ID exposed in URL or not properly invalidated.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Real-World Example: GitHub Token Leaks'),
                  Text(
                    'Developers have accidentally exposed authentication tokens in public repositories, allowing attackers to gain unauthorized access to systems and sensitive information.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Prevention Techniques:'),
                  sectionBulletPoints([
                    '1. Enforce strong password policies and MFA.',
                    '2. Avoid using default credentials.',
                    '3. Use secure password reset and recovery mechanisms.',
                    '4. Implement proper session management.',
                    '5. Regularly audit authentication flows for weaknesses.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Interactive Labs and Resources:'),
                  simpleResourceLink('OWASP Authentication Labs'),
                  simpleResourceLink('PortSwigger Labs - Authentication Vulnerabilities'),
                  const SizedBox(height: 16),
                  sectionTitle('Watch & Learn:'),
                  simpleResourceLink('Watch: Authentication Failures Explained (YouTube)'),
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

  Widget simpleResourceLink(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
    );
  }
}