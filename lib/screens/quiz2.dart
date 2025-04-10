import 'package:flutter/material.dart';

class Quiz2Screen extends StatefulWidget {
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
