import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Module9Screen extends StatelessWidget {
  const Module9Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A09. Security Logging & Monitoring Failures', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/slmf.jpg', // Make sure this image is in assets and declared in pubspec.yaml
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
                    'Security logging and monitoring failures are vulnerabilities that arise when systems fail to properly log or monitor security-related events. This creates blind spots where attackers can operate without detection.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Without effective logging and monitoring, organizations are often unaware of breaches until after the damage is done, making it harder to detect, analyze, or respond to incidents promptly.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Common Failures:'),
                  sectionBulletPoints([
                    '1. Not logging important security events (e.g. failed login attempts).',
                    '2. Not monitoring logs for suspicious behavior or anomalies.',
                    '3. Not storing logs long enough for effective analysis.',
                    '4. Not reviewing and responding to logged incidents.',
                    '5. Insecure logging mechanisms vulnerable to tampering.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Example Scenarios:'),
                  sectionBulletPoints([
                    '• *Target Data Breach (2013):* Attackers exploited unmonitored vendor access and POS systems without proper logging, stealing credit/debit card info from millions.',
                    '• *Yahoo! Breach:* Poor logging practices contributed to the compromise of over 800 million user accounts without early detection.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Impact:'),
                  Text(
                    'Insufficient logging and monitoring cannot be directly exploited like other vulnerabilities. However, they significantly weaken an organization\'s detection and response capabilities. According to OWASP, nearly all major breaches involve this issue at some level.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Prevention Techniques:'),
                  sectionBulletPoints([
                    '1. Log all authentication attempts, access control failures, and data access.',
                    '2. Store logs securely with integrity protection.',
                    '3. Monitor logs regularly and set up alerts for suspicious activity.',
                    '4. Maintain logs for sufficient duration for audit and forensics.',
                    '5. Regularly test your detection and alert systems.',
                    '6. Incorporate logging and monitoring in your incident response plan.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Interactive Labs and Resources:'),
                  simpleResourceLink('TryHackMe: Logging Made Easy',context),
                  simpleResourceLink('Splunk Free Training - Security Use Cases',context),
                  simpleResourceLink('Elastic Stack (ELK) - Log Management',context),
                  const SizedBox(height: 16),
                  sectionTitle('Watch & Learn:'),
                  simpleResourceLink('Watch: Understanding Logging and Monitoring Failures (YouTube)',context),
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
      url = 'https://www.youtube.com/watch?v=t_VWIGfkakc'; // YouTube video URL
    } else if (title.contains('TryHackMe')) {
      url = 'https://tryhackme.com/room/owasptop102021'; // Example URL
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