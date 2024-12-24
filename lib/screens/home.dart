import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:owasp_insight/screens/auth.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:owasp_insight/screens/OWASP.dart';
import 'quiz.dart'; // Import the quiz screen
import 'module1.dart'; // Import the screens for each module
import 'module2.dart';
import 'module3.dart';
import 'module4.dart'; // Import module screens

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.jpg', // Add your logo path
              height: 50,
            ),
            SizedBox(width: 10),
            Text(
              'OWASP Top 10',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              final Uri url = Uri.parse('https://owasp-risk-rating.com/'); // Replace with your URL
              // if (await canLaunchUrl(url)) {
              //   await launchUrl(url, mode: LaunchMode.externalApplication);
              // } else {
              //   throw 'Could not launch $url';
              // }
            },
            icon: Icon(
              Icons.calculate,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => AuthScreen(), // Replace with your login screen
                ),
              );
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              'assets/images/vuln.jpg', // Add your image path
              height: 300,
              width: MediaQuery.of(context).size.width, // Dynamically set width
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 12, // Include the 10 modules + Quiz
              itemBuilder: (context, index) {
                final moduleNames = [
                  'Introduction to OWASP',
                  'A01. Broken Access Control',
                  'A02. Cryptographic Failure',
                  'A03. Injection',
                  'A04. Insecure Design',
                  'A05. Security Misconfiguration',
                  'A06. Vulnerable and Outdated components',
                  'A07. Identification and Authentication Failure',
                  'A08. Software and Data Integrity Failures',
                  'A09. Security Logging and Monitoring Failure',
                  'A10. Server-Side Request Forgery(SSRF)',
                  'Quiz: Test Your Knowledge',
                ];

                // Define a map of module screens
                final moduleScreens = [
                  OwaspScreen(),
                  Module1Screen(),
                  Module2Screen(),
                  Module3Screen(),
                  Module4Screen(),
                  // Add other module screens here
                  null, // Placeholder for quiz
                ];

                return ListTile(
                  title: Text(
                    moduleNames[index],
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  leading: Icon(index == 11 ? Icons.quiz : Icons.book), // Quiz icon for the last item
                  onTap: () {
                    if (index < 11) {
                      // Navigate to the corresponding screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => moduleScreens[index]!,
                        ),
                      );
                    } else {
                      // Navigate to Quiz screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
