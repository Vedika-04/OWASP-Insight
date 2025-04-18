import 'package:flutter/material.dart';

class Module5Screen extends StatelessWidget {
  const Module5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A05. Security Misconfiguration', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/sma.jpg', // Ensure this image exists in assets
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
                    'Security Misconfiguration happens when security settings are poorly defined, default settings are not changed, or systems are not updated. It’s one of the most common and dangerous issues in cybersecurity.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'This vulnerability can affect any component of the stack — network services, platform, web server, application server, database, frameworks, or custom code.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Common Causes of Security Misconfiguration:'),
                  sectionBulletPoints([
                    '1. Default credentials and unnecessary services enabled.',
                    '2. Error messages revealing stack traces or system details.',
                    '3. Cloud storage buckets left open to the public.',
                    '4. Misconfigured HTTP headers and permissions.',
                    '5. Unpatched systems and software.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Real-World Example: Capital One Data Breach (2019)'),
                  Text(
                    'A misconfigured AWS S3 bucket allowed an attacker to access sensitive data of over 100 million customers. This breach highlights how a simple misconfiguration can have massive consequences.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Prevention Techniques:'),
                  sectionBulletPoints([
                    '1. Disable unused features and services.',
                    '2. Implement a secure configuration management process.',
                    '3. Perform regular audits and vulnerability scans.',
                    '4. Use automated tools to detect misconfigurations.',
                    '5. Keep all components and systems updated and patched.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Interactive Labs and Resources:'),
                  simpleResourceLink('TryHackMe - Misconfiguration Labs'),
                  simpleResourceLink('PortSwigger Labs - Security Misconfiguration'),
                  const SizedBox(height: 16),
                  sectionTitle('Watch & Learn:'),
                  simpleResourceLink('Watch: Security Misconfiguration Explained (YouTube)'),
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