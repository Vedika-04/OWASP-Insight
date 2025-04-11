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
import 'module5.dart';
import 'module6.dart';
import 'module7.dart';
import 'module8.dart'; // Import module screens
import 'module9.dart';
import 'module10.dart';
import 'quiz1.dart'; // Import the screens for each module
import 'quiz2.dart';
import 'quiz3.dart';
import 'quiz4.dart'; // Import module screens
import 'quiz5.dart';
import 'quiz6.dart';
import 'quiz7.dart';
import 'quiz8.dart'; // Import module screens
import 'quiz9.dart';
import 'quiz10.dart';


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
          // IconButton(
          //   onPressed: () async {
          //     final Uri url = Uri.parse('https://owasp-risk-rating.com/'); // Replace with your URL
          //     // if (await canLaunchUrl(url)) {
          //     //   await launchUrl(url, mode: LaunchMode.externalApplication);
          //     // } else {
          //     //   throw 'Could not launch $url';
          //     // }
          //   },
          //   icon: Icon(
          //     Icons.calculate,
          //     color: Colors.white,
          //   ),
          // ),
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
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              'assets/images/vuln.jpg', // Add your image path
              height: 250,
              // width: 400,
              width: MediaQuery.of(context).size.width, // Dynamically set width
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 22, // Include the 10 modules + Quiz
              itemBuilder: (context, index) {
                final moduleNames = [
                  'Introduction to OWASP',
                  'A01. Broken Access Control',
                  'A01. Practice Quiz',
                  'A02. Cryptographic Failure',
                  'A02. Practice Quiz',
                  'A03. Injection',
                  'A03. Practice Quiz',
                  'A04. Insecure Design',
                  'A04. Practice Quiz',
                  'A05. Security Misconfiguration',
                  'A05. Practice Quiz',
                  'A06. Vulnerable and Outdated components',
                  'A06. Practice Quiz',
                  'A07. Identification and Authentication Failure',
                  'A07. Practice Quiz',
                  'A08. Software and Data Integrity Failures',
                  'A08. Practice Quiz',
                  'A09. Security Logging and Monitoring Failure',
                  'A09. Practice Quiz',
                  'A10. Server-Side Request Forgery(SSRF)',
                  'A10. Practice Quiz',
                  'Quiz: Test Your Knowledge',
                ];

                // Define a map of module screens
                final moduleScreens = [
                  OwaspScreen(),
                  Module1Screen(),
                  Quiz1Screen(),
                  Module2Screen(),
                  Quiz2Screen(),
                  Module3Screen(),
                  Quiz3Screen(),
                  Module4Screen(),
                  Quiz4Screen(),
                  Module5Screen(),
                  Quiz5Screen(),
                  Module6Screen(),
                  Quiz6Screen(),
                  Module7Screen(),
                  Quiz7Screen(),
                  Module8Screen(),
                  Quiz8Screen(),
                  Module9Screen(),
                  Quiz9Screen(),
                  Module10Screen(),
                  Quiz10Screen(),
                  QuizScreen(),
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
                  leading: Icon(
                    moduleNames[index].toLowerCase().contains('quiz') ? Icons.quiz : Icons.book,
                    color: moduleNames[index].toLowerCase().contains('quiz')
                        ? Colors.deepPurple
                        : Colors.teal,
                  ), // Quiz icon for the last item
                  onTap: () {
                    if (index < 21) {
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
