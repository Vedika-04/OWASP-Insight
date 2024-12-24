import 'package:flutter/material.dart';

class Module3Screen extends StatelessWidget {
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
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/images/injection.png',
                height: 300,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Heading 1
                  Text(
                    'Overview:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Content under Heading 1 with bold text
                  Text.rich(
                    TextSpan(
                      text: 'Broken Access Control occurs when users can access resources or operations that they should not be allowed to. ',
                      style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'This vulnerability is critical as it can lead to data leaks, privilege escalation, and unauthorized actions.',
                          style: TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.brown), // Bold and red
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Heading 2
                  Text(
                    'Key Concepts:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Content under Heading 2 with bold and highlighted text
                  Text.rich(
                    TextSpan(
                      text: '1. ',
                      style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Role-based access control (RBAC)\n',
                          style: TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold), // Bold
                        ),
                        TextSpan(
                          text: '2. ',
                          style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                        ),
                        TextSpan(
                          text: 'Access Control Lists (ACLs)\n',
                          style: TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold), // Bold
                        ),
                        TextSpan(
                          text: '3. ',
                          style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                        ),
                        TextSpan(
                          text: 'Proper validation of user inputs\n',
                          style: TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold), // Bold
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Heading 3
                  Text(
                    'Mitigation Strategies:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Content under Heading 3 with bold text
                  Text.rich(
                    TextSpan(
                      text: 'To mitigate Broken Access Control:\n',
                      style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
                      children: <TextSpan>[
                        TextSpan(
                          text: '1. Implement robust RBAC for resource access\n',
                          style: TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold), // Bold
                        ),
                        TextSpan(
                          text: '2. Ensure proper input validation and data sanitization\n',
                          style: TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold), // Bold
                        ),
                        TextSpan(
                          text: '3. Use secure session management practices',
                          style: TextStyle(fontSize: 18, fontFamily: 'Montserrat', fontWeight: FontWeight.bold), // Bold
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
