import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Module10Screen extends StatelessWidget {
  const Module10Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A10. Server-Side Request Forgery (SSRF)', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(
                'assets/images/ssrf.jpg', // Add your SSRF-related image to assets
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
                    'Server-side request forgery (SSRF) is a web vulnerability that allows an attacker to make the server perform requests to unintended locations. This often results in access to internal-only resources or leaks of sensitive information.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('How SSRF Works:'),
                  Text(
                    'In a typical SSRF attack, the attacker manipulates a request so that the server fetches a remote resource, often leading to exposure of internal services, credentials, or even remote code execution depending on the vulnerability severity.',
                    style: bodyTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  sectionTitle('Real-World Impact:'),
                  sectionBulletPoints([
                    '• Unauthorized access to internal networks or backend services.',
                    '• Bypassing firewalls and IP whitelisting.',
                    '• Internal port scanning or network discovery.',
                    '• Leak of sensitive data such as cloud metadata or internal credentials.',
                    '• Possibility of remote command execution if exploited deeply.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Common Attack Scenarios:'),
                  sectionBulletPoints([
                    '1. Misconfigured URLs accepting unvalidated user input.',
                    '2. Exploiting open redirects or proxy requests.',
                    '3. Accessing cloud metadata URLs (e.g., AWS EC2 metadata: http://169.254.169.254).',
                    '4. Exploiting unsegmented internal network structure.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Prevention Techniques:'),
                  sectionBulletPoints([
                    '1. Validate and sanitize all user input.',
                    '2. Whitelist allowed domains and block internal IP ranges.',
                    '3. Disable unused URL protocols such as Gopher or File.',
                    '4. Set network-layer controls to limit outbound connections.',
                    '5. Monitor outgoing traffic for suspicious patterns.',
                    '6. Use web application firewalls and SSRF-specific detection rules.',
                  ]),
                  const SizedBox(height: 16),
                  sectionTitle('Interactive Labs and Resources:'),
                  simpleResourceLink('TryHackMe: SSRF Room - https://tryhackme.com/room/ssrfhr',context),
                  simpleResourceLink('PortSwigger Web Security Academy - SSRF Labs',context),
                  const SizedBox(height: 16),
                  sectionTitle('Watch & Learn:'),
                  simpleResourceLink('Watch: Server Side Request Forgery (SSRF) Explained (YouTube)',context),
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
      url = 'https://www.youtube.com/watch?v=_IVjvNelzMw'; // YouTube video URL
    } else if (title.contains('TryHackMe')) {
      url = 'http://portswigger.net/web-security/all-labs#server-side-request-forgery-ssrf'; // Example URL
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