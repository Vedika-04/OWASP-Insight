import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Module2Screen extends StatelessWidget {
  const Module2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2. Cryptographic Failures', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                'assets/images/crypto2-A2.png', // Add your Cryptographic Failures-related image to assets
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('Introduction to Cryptographic Failures:'),
                  Text(
                    'Cryptographic Failures, listed second in the OWASP Top 10 (2021), refer to vulnerabilities caused by improper use or implementation of cryptographic techniques. These failures expose sensitive data such as passwords, financial information, and personal identifiers to unauthorized users. In the OWASP 2017 list, this was previously termed "Sensitive Data Exposure", which was later renamed to "Cryptographic Failures" in 2021 to better highlight the root cause rather than the symptom.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Why Cryptography Matters:'),
                  Text(
                    'Cryptography plays a pivotal role in securing data at rest and in transit, forming the backbone of the CIA Triad (Confidentiality, Integrity, and Availability). Failures in cryptography can severely compromise data security, leading to theft, reputational damage, and regulatory penalties.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Understanding Cryptographic Failures:'),
                  Text(
                    'Cryptographic Failures are a symptom, not a direct cause. They indicate that the exposure of sensitive information is due to improper cryptographic practices.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Common Causes of Cryptographic Failures:'),
                  sectionBulletPoints([
                    '• Not Using Encryption: Sensitive data transmitted or stored without encryption.',
                    '• Insecure Cryptographic Functions: Usage of outdated, broken, or risky algorithms.',
                    '• Improper Key Management: Poor handling of cryptographic keys leading to unauthorized access.',
                    '• Insufficient Entropy: Predictable randomness reduces cryptographic strength.',
                    '• Use of Hard-Coded Credentials: Embedding passwords or keys directly into code.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Related CWEs (Common Weakness Enumerations):'),
                  sectionBulletPoints([
                    '• CWE-259: Use of Hard-coded Password.',
                    '• CWE-327: Broken or Risky Cryptographic Algorithm.',
                    '• CWE-331: Insufficient Entropy.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Real-World Implications of Cryptographic Failures:'),
                  Text(
                    'Cryptographic failures can have severe consequences, including unauthorized decryption of sensitive data, forgery of critical information, impersonation of legitimate users, financial losses, and regulatory fines. Reputation damage is also a significant risk.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Notable Example:'),
                  Text(
                    '• Heartbleed Vulnerability (OpenSSL, 2014): A flaw in the TLS heartbeat extension exposed millions of users\' sensitive data, showcasing the devastating impact of cryptographic mishandling.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Common Scenarios of Cryptographic Failures:'),
                  sectionBulletPoints([
                    '• Sensitive data transmitted over HTTP, FTP, or SMTP without encryption.',
                    '• Data stored in plaintext in databases or files.',
                    '• Use of outdated algorithms like MD5 or SHA-1.',
                    '• Weak or reused encryption keys.',
                    '• Failure to validate server certificates during communication.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('How to Protect Against Cryptographic Failures:'),
                  sectionBulletPoints([
                    '1. Use Strong Encryption Algorithms: Implement AES, RSA, or ECC and avoid deprecated algorithms.',
                    '2. Regularly Update Cryptographic Libraries: Use the latest versions and apply patches promptly.',
                    '3. Proper Key Management: Use secure methods for key generation, storage, and rotation.',
                    '4. Secure Communication Protocols: Enforce HTTPS with TLS 1.2 or higher and validate certificates.',
                    '5. Ensure Sufficient Randomness: Use Cryptographically Secure Pseudo-Random Number Generators (CSPRNGs).',
                    '6. Secure Cryptographic Implementations: Use well-established cryptographic libraries and conduct penetration testing.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Organizational Measures for Mitigation:'),
                  sectionBulletPoints([
                    '• Employee Education: Train developers on secure cryptographic practices.',
                    '• Incident Response Plan: Prepare procedures for handling cryptographic failures.',
                    '• Security Assessments: Perform regular penetration tests and audits.',
                    '• Compliance: Adhere to industry standards like PCI DSS, HIPAA, GDPR.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Conclusion:'),
                  Text(
                    'Cryptographic Failures expose sensitive data due to improper or inadequate cryptographic practices. By adopting strong encryption, ensuring proper key management, maintaining updated libraries, and embedding security into the development process, organizations can mitigate cryptographic vulnerabilities effectively.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Interactive Labs and Resources:'),
                  simpleResourceLink('TryHackMe: Cryptographic Failures Room - https://tryhackme.com', context),
                  simpleResourceLink('PortSwigger Web Security Academy - Cryptographic Failures Labs', context),
                  const SizedBox(height: 16),
                  sectionTitle('Watch & Learn:'),
                  simpleResourceLink('Watch: Cryptographic Failures Explained (YouTube)', context),
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
      url = 'https://www.youtube.com/watch?v=O6dCX4P6OwU'; // Example real YouTube link
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