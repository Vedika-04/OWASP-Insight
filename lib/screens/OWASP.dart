import 'package:flutter/material.dart';

class OwaspScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction to OWASP', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:5.0, top:0.0, right:5.0, bottom:0.0),
              child: Image.asset(
                'assets/images/owasp logo.png',
                height: 300,
                width: 300,
              ),
            ),
            Padding(
              // padding: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.only(left:10.0, top:0.0, right:10.0, bottom:10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Overview Section
                  sectionTitle('OWASP:- (Open Web Application Security Project)'),
                  Text(
                    'OWASP is an international non-profit organization dedicated to web application security.'
                        ' One of OWASP’s core principles is that all of their materials be freely available and easily '
                        'accessible on their website, making it possible for anyone to improve their own web application '
                        'security. The materials they offer include documentation, tools, videos, and forums. Perhaps '
                        'their best-known project is the OWASP Top 10.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 30),
                  sectionTitle('What is OWASP Top-10 ?'),
                  Text(
                    'The OWASP Top 10 is a regularly updated report outlining security concerns for web application '
                        'security, focusing on the 10 most critical risks. The report is put together by a team of '
                        'security experts from all over the world.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 30),
                  Text(
                     'OWASP refers to the Top 10 as an ‘awareness document’ and they recommend that all companies '
                         'incorporate the report into their processes in order to minimize and/or mitigate security '
                         'risks.',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
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
                  // SizedBox(height: 20),
                  //
                  // // Key Concepts Section
                  // sectionTitle('Impact and Risks of Broken Access Control:'),
                  // sectionBulletPoints([
                  //   '1. The impact of broken access control can be catastrophic for organizations.Unauthorized access '
                  //       'to sensitive data can lead to data breaches, identity theft, financial loss, and damage to a '
                  //       'company’s reputation.',
                  //
                  //   '2. The risk associated with broken access control is high because it directly affects the confidentiality, integrity, and availability of data. An attacker exploiting this vulnerability can potentially access, modify, or delete any data on the system. This includes user data, system data, application data, and more. The larger the system and the more sensitive the data, the higher the risk.',
                  //   '3. Broken access control is a vulnerability that can’t be ignored, and organizations must take proactive steps to identify and mitigate it. This involves regular security testing, proper design and implementation of access controls, and continuous monitoring and updating of security measures.',
                  // ]),
                  // SizedBox(height: 16),
                  //
                  // // Mitigation Strategies Section
                  // sectionTitle('Examples and Types of Broken Access Control Attacks:'),
                  // sectionBulletPoints([
                  //   '1. URL Manipulation:-',
                  //   'Ensure proper input validation and data sanitization.',
                  //   'Use secure session management practices.',
                  // ]),
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
