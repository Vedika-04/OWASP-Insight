import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Module3Screen extends StatelessWidget {
  const Module3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A3. Injection', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                'assets/images/injection.png', // Add your Injection-related image to assets
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
                    'Injection attacks involve inserting malicious code into a vulnerable application, causing it to execute unintended commands. This can give attackers control over the application or even the underlying system.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Types of Injection Attacks:'),
                  sectionBulletPoints([
                    '• SQL Injection: Alters SQL queries to extract or modify database data.',
                    '• Cross-Site Scripting (XSS): Injects scripts into web pages to hijack sessions or redirect users.',
                    '• OS Command Injection: Executes arbitrary system commands through a vulnerable server.',
                    '• LDAP Injection: Manipulates LDAP queries to access or modify directory data.',
                    '• CRLF Injection: Injects carriage return and line feed characters to hijack HTTP responses.',
                    '• Host Header Injection: Alters HTTP host headers to perform cache poisoning or reset passwords.',
                    '• Mail Command Injection: Targets mail servers to send spam or conduct phishing.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Finding Injection Vulnerabilities:'),
                  sectionBulletPoints([
                    '• Add a single quote ( \') in input fields and observe error messages.',
                    '• Use tools like SQLMAP for SQL injection detection.',
                    '• Insert test scripts into fields to check for XSS vulnerabilities.',
                    '• Review code handling XML/JSON for unsafe request-making methods.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Prevention Techniques:'),
                  sectionBulletPoints([
                    '1. Authorize and validate users securely (use MFA, auditing).',
                    '2. Prevent dangerous file uploads (restrict macros and extensions).',
                    '3. Sanitize and validate all user inputs thoroughly.',
                    '4. Use prepared statements for database queries.',
                    '5. Implement Content Security Policies (CSP) to mitigate XSS.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Interactive Labs and Resources:'),
                  simpleResourceLink('TryHackMe: Injection Room - https://tryhackme.com', context),
                  simpleResourceLink('PortSwigger Web Security Academy - Injection Labs', context),
                  const SizedBox(height: 16),
                  sectionTitle('Watch & Learn:'),
                  simpleResourceLink('Watch: Injection Attacks Explained (YouTube)', context),
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
      url = 'https://www.youtube.com/watch?v=8XVHftQskxk&t=7s'; // Replace with real YouTube URL if you have one
    } else if (title.contains('TryHackMe')) {
      url = 'https://tryhackme.com/room/sqlinjectionlm'; // Example URL
    } else if (title.contains('PortSwigger')) {
      url = 'https://portswigger.net/web-security/all-labs#sql-injection'; // Example URL
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