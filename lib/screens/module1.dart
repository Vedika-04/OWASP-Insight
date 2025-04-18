import 'package:flutter/material.dart';

class Module1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A01. Broken Access Control', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                'assets/images/broken.jpg',
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
                    'Broken access control vulnerability is a security flaw that allows unauthorized users to access, modify, or delete data they shouldn’t have access to.',
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
                    'This vulnerability is considered one of the most critical web application security risks. It occurs when an application fails to properly enforce access controls, allowing attackers to bypass authorization and perform tasks as if they were legitimate users. ',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 16),
                  Text(
                      'This vulnerability can exist in various forms, such as inadequate session management, improper enforcement of role-based access controls, or insecure direct object references (IDOR).',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '"The Open Web Application Security Project (OWASP) lists broken access control as the #1 critical web application security risk (according to the OWASP Top 10 list, updated 2021)"',
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

                  // Key Concepts Section
                  sectionTitle('Impact and Risks of Broken Access Control:'),
                  sectionBulletPoints([
                    '1. The impact of broken access control can be catastrophic for organizations.Unauthorized access '
                        'to sensitive data can lead to data breaches, identity theft, financial loss, and damage to a '
                        'company’s reputation.',

                    '2. The risk associated with broken access control is high because it directly affects the confidentiality, integrity, and availability of data. An attacker exploiting this vulnerability can potentially access, modify, or delete any data on the system. This includes user data, system data, application data, and more. The larger the system and the more sensitive the data, the higher the risk.',
                    '3. Broken access control is a vulnerability that can’t be ignored, and organizations must take proactive steps to identify and mitigate it. This involves regular security testing, proper design and implementation of access controls, and continuous monitoring and updating of security measures.',
                  ]),
                  SizedBox(height: 16),

                  // Mitigation Strategies Section
                  sectionTitle('Examples and Types of Broken Access Control Attacks:'),
                  sectionBulletPoints([
                    '1. URL Manipulation:-',
                    'Ensure proper input validation and data sanitization.',
                    'Use secure session management practices.',
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
