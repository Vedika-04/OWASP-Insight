import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What does OWASP stand for?',
      'answers': [
        {'text': 'Open Web Application Security Project', 'isCorrect': true},
        {'text': 'Online Web Application Security Program', 'isCorrect': false},
        {'text': 'Operational Web Application Safety Project', 'isCorrect': false},
        {'text': 'Open Web Application Safety Protocol', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the primary risk of broken access control?',
      'answers': [
        {'text': 'Exposing sensitive data', 'isCorrect': false},
        {'text': 'Allowing unauthorized access ', 'isCorrect': true},
        {'text': 'Slowing down the website', 'isCorrect': false},
        {'text': 'Enabling Brute force attacks', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is an insecure cryptographic practice?',
      'answers': [
        {'text': 'Using AES-256', 'isCorrect': false},
        {'text': 'Hashing passwords with bcrypt', 'isCorrect': false},
        {'text': 'Implementing TLS for data transmission', 'isCorrect': false},
        {'text': 'Storing passwords in plain text', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'Which attack involves inserting malicious SQL queries?',
      'answers': [
        {'text': 'Cross-Site Scripting (XSS)', 'isCorrect': false},
        {'text': 'SQL Injection (SQLi) ', 'isCorrect': true},
        {'text': 'CSRF', 'isCorrect': false},
        {'text': 'Buffer Overflow', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is insecure design?',
      'answers': [
        {'text': 'Flaws in the application architecture  ', 'isCorrect': true},
        {'text': 'Security vulnerabilities due to weak coding practices', 'isCorrect': false},
        {'text': 'Using outdated encryption', 'isCorrect': false},
        {'text': 'Poor Documentation', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is a security misconfiguration?',
      'answers': [
        {'text': 'Default admin credentials ', 'isCorrect': true},
        {'text': 'Disabling unused services', 'isCorrect': false},
        {'text': 'Applying security patches', 'isCorrect': false},
        {'text': 'Restricting user permissions', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following increases the risk of using outdated components?',
      'answers': [
        {'text': 'Regular security patching', 'isCorrect': false},
        {'text': 'Using software with known vulnerabilities', 'isCorrect': true},
        {'text': 'Removing unused features', 'isCorrect': false},
        {'text': 'Enabling auto updates', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which authentication method is the most secure?',
      'answers': [
        {'text': 'Username and password only', 'isCorrect': false},
        {'text': 'Security questions', 'isCorrect': false},
        {'text': 'Email-based authentication', 'isCorrect': false},
        {'text': 'Multi-factor authentication (MFA) ', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'What is a software integrity failure',
      'answers': [
        {'text': 'Using untrusted updates ', 'isCorrect': true},
        {'text': 'Encrypting all data', 'isCorrect': false},
        {'text': 'Regular penetration testing', 'isCorrect': false},
        {'text': 'Secure software development', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is an example of poor logging?',
      'answers': [
        {'text': 'Storing logs in encrypted databases', 'isCorrect': false},
        {'text': 'Disabling logging to improve performance', 'isCorrect': false},
        {'text': 'Logging authentication failures ', 'isCorrect': true},
        {'text': 'Implementing real-time alerting', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does SSRF exploit?',
      'answers': [
        {'text': 'A server making requests on behalf of a user ', 'isCorrect': true},
        {'text': 'A user clicking a phishing link', 'isCorrect': false},
        {'text': 'Browser-based security vulnerabilities', 'isCorrect': false},
        {'text': 'A brute-force login attack', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following should NOT be logged?',
      'answers': [
        {'text': 'User login attempts', 'isCorrect': false},
        {'text': 'Unauthorized access attempts', 'isCorrect': false},
        {'text': 'Payment card details', 'isCorrect': true},
        {'text': 'Admin login activities', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the purpose of digital signatures?',
      'answers': [
        {'text': 'To encrypt user passwords', 'isCorrect': false},
        {'text': 'To create secure VPN tunnels', 'isCorrect': false},
        {'text': 'To store user credentials securely', 'isCorrect': false},
        {'text': 'To verify the integrity and authenticity of data', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'What is the best way to store passwords securely?',
      'answers': [
        {'text': 'Hashing with bcrypt and salting ', 'isCorrect': true},
        {'text': 'Encrypting and storing them in cookies', 'isCorrect': false},
        {'text': 'Using Base64 encoding', 'isCorrect': false},
        {'text': 'Storing them in plaintext', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the impact of using outdated components?',
      'answers': [
        {'text': 'Slower application performance', 'isCorrect': false},
        {'text': 'Improved compatibility', 'isCorrect': false},
        {'text': 'Increased attack surface ', 'isCorrect': true},
        {'text': 'Reduced security risks', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'How can security misconfigurations be prevented?',
      'answers': [
        {'text': 'Regular security audits ', 'isCorrect': true},
        {'text': 'Keeping default passwords', 'isCorrect': false},
        {'text': 'Exposing error messages', 'isCorrect': false},
        {'text': 'Allowing unrestricted API access', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What helps secure APIs against insecure design?',
      'answers': [
        {'text': 'Implementing authentication and authorization', 'isCorrect': true},
        {'text': 'Allowing unrestricted access ', 'isCorrect': false},
        {'text': 'Using client-side session tokens', 'isCorrect': false},
        {'text': 'Exposing all API endpoints', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the impact of an OS command injection attack?',
      'answers': [
        {'text': 'XSS exploitation', 'isCorrect': false},
        {'text': 'Redirection to a phishing page', 'isCorrect': false},
        {'text': 'Slower web performance', 'isCorrect': false},
        {'text': 'Execution of unauthorized system commands ', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'Which protocol should be used for encrypting web traffic?',
      'answers': [
        {'text': 'HTTP', 'isCorrect': false},
        {'text': 'TLS 1.3', 'isCorrect': true},
        {'text': 'FTP', 'isCorrect': false},
        {'text': 'Telnet', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does Role-Based Access Control (RBAC) do?',
      'answers': [
        {'text': 'Restricts users based on roles', 'isCorrect': true},
        {'text': 'Blocks all unauthorized requests', 'isCorrect': false},
        {'text': 'Enables users to bypass authentication', 'isCorrect': false},
        {'text': 'Encrypts all network traffic', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which HTTP status code indicates access is forbidden due to insufficient permissions?',
      'answers': [
        {'text': '200', 'isCorrect': false},
        {'text': '401', 'isCorrect': false},
        {'text': '403', 'isCorrect': true},
        {'text': '500', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What can prevent SQL Injection attacks?',
      'answers': [
        {'text': 'Allowing user input without validation', 'isCorrect': false},
        {'text': 'Using parameterized queries ', 'isCorrect': true},
        {'text': 'Using dynamic SQL', 'isCorrect': false},
        {'text': ' Disabling HTTPS', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which practice can reduce insecure design risks?',
      'answers': [
        {'text': 'Writing complex code', 'isCorrect': false},
        {'text': 'Disabling security updates', 'isCorrect': false},
        {'text': 'Storing credentials in client-side code', 'isCorrect': false},
        {'text': 'Implementing security-by-design ', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'What does a "default configuration" usually mean in security terms?',
      'answers': [
        {'text': 'Secure by default', 'isCorrect': false},
        {'text': 'Hardened automatically', 'isCorrect': false},
        {'text': 'Potentially insecure if not customized ', 'isCorrect': true},
        {'text': 'Disabled by default', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is insecure design?',
      'answers': [
        {'text': 'Flaws in the application architecture  ', 'isCorrect': true},
        {'text': 'Security vulnerabilities due to weak coding practices', 'isCorrect': false},
        {'text': 'Using outdated encryption', 'isCorrect': false},
        {'text': 'Poor Documentation', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does OWASP stand for?',
      'answers': [
        {'text': 'Open Web Application Security Project', 'isCorrect': true},
        {'text': 'Online Web Application Security Program', 'isCorrect': false},
        {'text': 'Operational Web Application Safety Project', 'isCorrect': false},
        {'text': 'Open Web Application Safety Protocol', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the primary risk of broken access control?',
      'answers': [
        {'text': 'Exposing sensitive data', 'isCorrect': false},
        {'text': 'Allowing unauthorized access ', 'isCorrect': true},
        {'text': 'Slowing down the website', 'isCorrect': false},
        {'text': 'Enabling Brute force attacks', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is an insecure cryptographic practice?',
      'answers': [
        {'text': 'Using AES-256', 'isCorrect': false},
        {'text': 'Hashing passwords with bcrypt', 'isCorrect': false},
        {'text': 'Implementing TLS for data transmission', 'isCorrect': false},
        {'text': 'Storing passwords in plain text', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'Which attack involves inserting malicious SQL queries?',
      'answers': [
        {'text': 'Cross-Site Scripting (XSS)', 'isCorrect': false},
        {'text': 'SQL Injection (SQLi) ', 'isCorrect': true},
        {'text': 'CSRF', 'isCorrect': false},
        {'text': 'Buffer Overflow', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is insecure design?',
      'answers': [
        {'text': 'Flaws in the application architecture  ', 'isCorrect': true},
        {'text': 'Security vulnerabilities due to weak coding practices', 'isCorrect': false},
        {'text': 'Using outdated encryption', 'isCorrect': false},
        {'text': 'Poor Documentation', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does OWASP stand for?',
      'answers': [
        {'text': 'Open Web Application Security Project', 'isCorrect': true},
        {'text': 'Online Web Application Security Program', 'isCorrect': false},
        {'text': 'Operational Web Application Safety Project', 'isCorrect': false},
        {'text': 'Open Web Application Safety Protocol', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the primary risk of broken access control?',
      'answers': [
        {'text': 'Exposing sensitive data', 'isCorrect': false},
        {'text': 'Allowing unauthorized access ', 'isCorrect': true},
        {'text': 'Slowing down the website', 'isCorrect': false},
        {'text': 'Enabling Brute force attacks', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is an insecure cryptographic practice?',
      'answers': [
        {'text': 'Using AES-256', 'isCorrect': false},
        {'text': 'Hashing passwords with bcrypt', 'isCorrect': false},
        {'text': 'Implementing TLS for data transmission', 'isCorrect': false},
        {'text': 'Storing passwords in plain text', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'Which attack involves inserting malicious SQL queries?',
      'answers': [
        {'text': 'Cross-Site Scripting (XSS)', 'isCorrect': false},
        {'text': 'SQL Injection (SQLi) ', 'isCorrect': true},
        {'text': 'CSRF', 'isCorrect': false},
        {'text': 'Buffer Overflow', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is insecure design?',
      'answers': [
        {'text': 'Flaws in the application architecture  ', 'isCorrect': true},
        {'text': 'Security vulnerabilities due to weak coding practices', 'isCorrect': false},
        {'text': 'Using outdated encryption', 'isCorrect': false},
        {'text': 'Poor Documentation', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does OWASP stand for?',
      'answers': [
        {'text': 'Open Web Application Security Project', 'isCorrect': true},
        {'text': 'Online Web Application Security Program', 'isCorrect': false},
        {'text': 'Operational Web Application Safety Project', 'isCorrect': false},
        {'text': 'Open Web Application Safety Protocol', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the primary risk of broken access control?',
      'answers': [
        {'text': 'Exposing sensitive data', 'isCorrect': false},
        {'text': 'Allowing unauthorized access ', 'isCorrect': true},
        {'text': 'Slowing down the website', 'isCorrect': false},
        {'text': 'Enabling Brute force attacks', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is an insecure cryptographic practice?',
      'answers': [
        {'text': 'Using AES-256', 'isCorrect': false},
        {'text': 'Hashing passwords with bcrypt', 'isCorrect': false},
        {'text': 'Implementing TLS for data transmission', 'isCorrect': false},
        {'text': 'Storing passwords in plain text', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'Which attack involves inserting malicious SQL queries?',
      'answers': [
        {'text': 'Cross-Site Scripting (XSS)', 'isCorrect': false},
        {'text': 'SQL Injection (SQLi) ', 'isCorrect': true},
        {'text': 'CSRF', 'isCorrect': false},
        {'text': 'Buffer Overflow', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is insecure design?',
      'answers': [
        {'text': 'Flaws in the application architecture  ', 'isCorrect': true},
        {'text': 'Security vulnerabilities due to weak coding practices', 'isCorrect': false},
        {'text': 'Using outdated encryption', 'isCorrect': false},
        {'text': 'Poor Documentation', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does OWASP stand for?',
      'answers': [
        {'text': 'Open Web Application Security Project', 'isCorrect': true},
        {'text': 'Online Web Application Security Program', 'isCorrect': false},
        {'text': 'Operational Web Application Safety Project', 'isCorrect': false},
        {'text': 'Open Web Application Safety Protocol', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the primary risk of broken access control?',
      'answers': [
        {'text': 'Exposing sensitive data', 'isCorrect': false},
        {'text': 'Allowing unauthorized access ', 'isCorrect': true},
        {'text': 'Slowing down the website', 'isCorrect': false},
        {'text': 'Enabling Brute force attacks', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is an insecure cryptographic practice?',
      'answers': [
        {'text': 'Using AES-256', 'isCorrect': false},
        {'text': 'Hashing passwords with bcrypt', 'isCorrect': false},
        {'text': 'Implementing TLS for data transmission', 'isCorrect': false},
        {'text': 'Storing passwords in plain text', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'Which attack involves inserting malicious SQL queries?',
      'answers': [
        {'text': 'Cross-Site Scripting (XSS)', 'isCorrect': false},
        {'text': 'SQL Injection (SQLi) ', 'isCorrect': true},
        {'text': 'CSRF', 'isCorrect': false},
        {'text': 'Buffer Overflow', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is insecure design?',
      'answers': [
        {'text': 'Flaws in the application architecture  ', 'isCorrect': true},
        {'text': 'Security vulnerabilities due to weak coding practices', 'isCorrect': false},
        {'text': 'Using outdated encryption', 'isCorrect': false},
        {'text': 'Poor Documentation', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does OWASP stand for?',
      'answers': [
        {'text': 'Open Web Application Security Project', 'isCorrect': true},
        {'text': 'Online Web Application Security Program', 'isCorrect': false},
        {'text': 'Operational Web Application Safety Project', 'isCorrect': false},
        {'text': 'Open Web Application Safety Protocol', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the primary risk of broken access control?',
      'answers': [
        {'text': 'Exposing sensitive data', 'isCorrect': false},
        {'text': 'Allowing unauthorized access ', 'isCorrect': true},
        {'text': 'Slowing down the website', 'isCorrect': false},
        {'text': 'Enabling Brute force attacks', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is an insecure cryptographic practice?',
      'answers': [
        {'text': 'Using AES-256', 'isCorrect': false},
        {'text': 'Hashing passwords with bcrypt', 'isCorrect': false},
        {'text': 'Implementing TLS for data transmission', 'isCorrect': false},
        {'text': 'Storing passwords in plain text', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'Which attack involves inserting malicious SQL queries?',
      'answers': [
        {'text': 'Cross-Site Scripting (XSS)', 'isCorrect': false},
        {'text': 'SQL Injection (SQLi) ', 'isCorrect': true},
        {'text': 'CSRF', 'isCorrect': false},
        {'text': 'Buffer Overflow', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is insecure design?',
      'answers': [
        {'text': 'Flaws in the application architecture  ', 'isCorrect': true},
        {'text': 'Security vulnerabilities due to weak coding practices', 'isCorrect': false},
        {'text': 'Using outdated encryption', 'isCorrect': false},
        {'text': 'Poor Documentation', 'isCorrect': false},
      ],
    },
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;
  bool _answered = false;

  void _answerQuestion(bool isCorrect, int index) {
    if (_answered) return;

    setState(() {
      _answered = true;
      _selectedAnswerIndex = index;
      if (isCorrect) _score++;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
        _answered = false;
      });
    });
  }

  Color _getButtonColor(bool isCorrect, int index) {
    if (!_answered) return Colors.grey.shade50;
    if (_selectedAnswerIndex == index) {
      return isCorrect ? Colors.green : Colors.red;
    }
    if (isCorrect) return Colors.green; // Optionally highlight the correct one too
    return Colors.grey.shade200;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz: Test Your Knowledge')),
      body: _currentQuestionIndex < _questions.length
          ? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              _questions[_currentQuestionIndex]['questionText'] as String,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ...(_questions[_currentQuestionIndex]['answers']
            as List<Map<String, Object>>)
                .asMap()
                .entries
                .map(
                  (entry) {
                final index = entry.key;
                final answer = entry.value;
                final isCorrect = answer['isCorrect'] as bool;
                final text = answer['text'] as String;

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ElevatedButton(
                    onPressed: () =>
                        _answerQuestion(isCorrect, index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      _getButtonColor(isCorrect, index),
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            )
                .toList(),
          ],
        ),
      )
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quiz Completed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Your Score: $_score/${_questions.length}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                  _selectedAnswerIndex = null;
                  _answered = false;
                });
              },
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
