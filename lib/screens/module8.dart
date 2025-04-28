import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Module8Screen extends StatelessWidget {
  const Module8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A08. Software & Data Integrity Failures', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/security_and_data_integrity.jpg', // Ensure this image is in your assets folder and declared in pubspec.yaml
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
                    'Software and data integrity failures relate to code and infrastructure that doesn’t properly protect against integrity violations. This often involves using components from untrusted or unverified sources, insecure CI/CD pipelines, or automatic updates without integrity checks.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Such failures can allow attackers to introduce malicious code, gain unauthorized access, or completely compromise systems.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Common Attacks:'),
                  sectionBulletPoints([
                    '1. Cache Poisoning',
                    '2. Code Injection',
                    '3. Command Execution',
                    '4. Denial of Service (DoS)',
                    '5. Insecure Deserialization',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Example Scenarios:'),
                  sectionBulletPoints([
                    '• *Update Without Signing:* Devices like routers and set-top boxes install updates without verifying them, making them easy targets for attackers.',
                    '• *SolarWinds Orion Attack:* A sophisticated nation-state attack where malicious updates were distributed to 18,000+ organizations.',
                    '• *Insecure Deserialization:* Attackers exploit serialized Java objects passed between a React frontend and Spring Boot backend to achieve remote code execution.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Prevention Techniques:'),
                  sectionBulletPoints([
                    '1. Use digital signatures to verify the authenticity and integrity of software and updates.',
                    '2. Consume libraries only from trusted repositories.',
                    '3. Employ tools like OWASP Dependency Check or CycloneDX to detect vulnerabilities.',
                    '4. Establish a secure and segregated CI/CD pipeline.',
                    '5. Avoid sending unsigned or unencrypted serialized data to clients.',
                    '6. Perform thorough code and configuration reviews.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Interactive Labs and Resources:'),
                  simpleResourceLink('OWASP Dependency Check - Tool Overview',context),
                  simpleResourceLink('CycloneDX - Software Bill of Materials (SBOM)',context),
                  simpleResourceLink('TryHackMe: Supply Chain Attack Walkthrough',context),
                  const SizedBox(height: 16),
                  sectionTitle('Watch & Learn:'),
                  simpleResourceLink('Watch: Understanding Software Supply Chain Attacks (YouTube)',context),
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

  // Dialog to show URL and allow copying
  void _showCopyDialog(BuildContext context, String title) {
    String url = '';
    if (title.contains('YouTube')) {
      url = 'https://www.youtube.com/watch?v=TwfLvG0D6dc'; // YouTube video URL
    } else if (title.contains('TryHackMe')) {
      url = 'https://tryhackme.com'; // Example URL
    } else if (title.contains('PortSwigger')) {
      url = 'https://portswigger.net'; // Example URL
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