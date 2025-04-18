import 'package:flutter/material.dart';

class Module3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A03. Injection Vulnerabilities', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Section (optional, can be added if needed)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/injection.png', // Replace with actual image if needed
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Overview Section
                  sectionTitle('Overview:'),
                  Text(
                    'Injection attacks involve injecting malicious code into a vulnerable application. The attacker gains control over the application or system, which can lead to severe consequences like data loss, unauthorized access, and more.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This vulnerability is common in applications that fail to properly validate user input or sanitize data before interacting with systems like databases, servers, and other external components.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Injection vulnerabilities can be found in several areas, including SQL injection, XSS, OS command injection, LDAP injection, and more.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '"The Open Web Application Security Project (OWASP) lists injection attacks as one of the top security risks in web applications."',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 20),

                  // Impact and Risks Section
                  sectionTitle('Impact and Risks of Injection Attacks:'),
                  sectionBulletPoints([
                    '1. Injection attacks can result in unauthorized access to sensitive data, system takeover, and potential data loss or theft.',
                    '2. The risk is particularly high in environments where user input is not adequately validated or sanitized, allowing attackers to manipulate queries and commands.',
                    '3. Exploiting injection vulnerabilities can lead to a loss of system integrity, data breaches, and financial or reputational damage.',
                  ]),
                  SizedBox(height: 16),

                  // Examples and Types Section
                  sectionTitle('Examples and Types of Injection Attacks:'),
                  sectionBulletPoints([
                    '1. SQL Injection:',
                    'Manipulating SQL queries to access or modify data.',
                    'Use parameterized queries to prevent SQL injection.',
                    '2. Cross-Site Scripting (XSS):',
                    'Injecting malicious scripts into web pages to hijack user sessions.',
                    'Sanitize input and use secure coding practices to prevent XSS.',
                    '3. OS Command Injection:',
                    'Injecting OS-level commands to execute on the server.',
                    'Avoid concatenating user input into system commands.',
                  ]),
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
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
        color: Colors.black87,
      ),
    );
  }

  Widget sectionBulletPoints(List<String> points, {double gap = 10.0}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points.map((point) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: gap),
          child: Text(
            point,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      }).toList(),
    );
  }
}
