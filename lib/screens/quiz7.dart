import 'package:flutter/material.dart';

class Quiz7Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz7Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What does an attacker exploit in a brute-force attack?',
      'answers': [
        {'text': 'Server hardware', 'isCorrect': false},
        {'text': 'Rate limits', 'isCorrect': false},
        {'text': 'Repeated login attempts with guessed credentials', 'isCorrect': true},
        {'text': 'User email verification', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which method can prevent session hijacking?',
      'answers': [
        {'text': 'Using short usernames', 'isCorrect': false},
        {'text': 'Encrypting session tokens and using HTTPS', 'isCorrect': true},
        {'text': 'Enabling auto-login', 'isCorrect': false},
        {'text': 'Storing credentials in local storage', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does password spraying involve?',
      'answers': [
        {'text': 'Flooding a login form with random passwords', 'isCorrect': false},
        {'text': 'Using a few common passwords across many accounts', 'isCorrect': true},
        {'text': 'Guessing passwords based on usernames', 'isCorrect': false},
        {'text': 'Bypassing 2FA', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the impact of missing account lockout mechanisms?',
      'answers': [
        {'text': 'System performance drops', 'isCorrect': false},
        {'text': 'Allows brute-force and password guessing attacks', 'isCorrect': true},
        {'text': 'Exposes cookies', 'isCorrect': false},
        {'text': 'Increases UI bugs', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What’s a secure session timeout strategy?',
      'answers': [
        {'text': 'Sessions never expire', 'isCorrect': false},
        {'text': 'Sessions expire after a long idle time', 'isCorrect': false},
        {'text': 'Short timeout with user re-authentication', 'isCorrect': true},
        {'text': 'Timeouts triggered only by clicking logout', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which is not a secure password requirement?',
      'answers': [
        {'text': 'Minimum 8 characters', 'isCorrect': false},
        {'text': 'Includes uppercase, lowercase, numbers, and symbols', 'isCorrect': false},
        {'text': 'Use of dictionary words', 'isCorrect': true},
        {'text': 'No reuse of previous passwords', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Why is 2FA (Two-Factor Authentication) effective?',
      'answers': [
        {'text': 'It prevents all XSS attacks', 'isCorrect': false},
        {'text': 'It requires something you know + something you have', 'isCorrect': true},
        {'text': 'It improves UI flow', 'isCorrect': false},
        {'text': 'It speeds up login', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is an example of improper credential storage?',
      'answers': [
        {'text': 'Hashed and salted passwords', 'isCorrect': false},
        {'text': 'Encrypted passwords using bcrypt', 'isCorrect': false},
        {'text': 'Storing plaintext passwords in a database', 'isCorrect': true},
        {'text': 'Using environment variables', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the main purpose of identity management systems?',
      'answers': [
        {'text': 'Generate reports', 'isCorrect': false},
        {'text': 'Store email addresses', 'isCorrect': false},
        {'text': 'Manage user access, roles, and authentication', 'isCorrect': true},
        {'text': 'Enhance UI appearance', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What vulnerability occurs when session tokens are not invalidated after logout?',
      'answers': [
        {'text': 'CSRF', 'isCorrect': false},
        {'text': 'Session fixation', 'isCorrect': false},
        {'text': 'Session reuse or hijacking', 'isCorrect': true},
        {'text': 'Open redirect', 'isCorrect': false},
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
                    onPressed: () => _answerQuestion(isCorrect, index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getButtonColor(isCorrect, index),
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      alignment: Alignment.center,
                    ),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 16),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
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
