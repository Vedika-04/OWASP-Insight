import 'package:flutter/material.dart';

class Quiz2Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz2Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Which of the following algorithms is considered outdated and insecure for modern cryptographic use?',
      'answers': [
        {'text': 'SHA-256', 'isCorrect': false},
        {'text': 'AES', 'isCorrect': false},
        {'text': 'DES', 'isCorrect': true},
        {'text': 'RSA-2048', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the main purpose of cryptographic hashing in security?',
      'answers': [
        {'text': 'To compress files', 'isCorrect': false},
        {'text': 'To provide a unique and irreversible fingerprint', 'isCorrect': true},
        {'text': 'To encrypt data', 'isCorrect': false},
        {'text': 'To sign documents digitally', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is a common mistake in cryptography?',
      'answers': [
        {'text': 'Using unique salts', 'isCorrect': false},
        {'text': 'Using AES in GCM mode', 'isCorrect': false},
        {'text': 'Creating your own encryption algorithm', 'isCorrect': true},
        {'text': 'Applying HTTPS on login pages', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does Perfect Forward Secrecy (PFS) ensure?',
      'answers': [
        {'text': 'Users can forward encrypted messages', 'isCorrect': false},
        {'text': 'Older session keys are safe even if the current key is compromised', 'isCorrect': true},
        {'text': 'All data is encrypted during storage', 'isCorrect': false},
        {'text': 'Passwords are stored in plaintext', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which cryptographic protocol is deprecated due to known vulnerabilities?',
      'answers': [
        {'text': 'TLS 1.3', 'isCorrect': false},
        {'text': 'SSL 3.0', 'isCorrect': true},
        {'text': 'HTTPS', 'isCorrect': false},
        {'text': 'IPsec', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which situation best describes a cryptographic failure?',
      'answers': [
        {'text': 'A user bypassing access controls', 'isCorrect': false},
        {'text': 'Sensitive data sent over HTTP instead of HTTPS', 'isCorrect': true},
        {'text': 'Input not sanitized', 'isCorrect': false},
        {'text': 'Cross-site scripting occurring in input fields', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the main danger of using a predictable random number generator (RNG) in cryptography?',
      'answers': [
        {'text': 'Decreased performance', 'isCorrect': false},
        {'text': 'Easily guessable outputs', 'isCorrect': true},
        {'text': 'Increased entropy', 'isCorrect': false},
        {'text': 'Failure to hash data', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which type of encryption is considered stronger for modern data security?',
      'answers': [
        {'text': 'Symmetric encryption', 'isCorrect': false},
        {'text': 'Asymmetric encryption', 'isCorrect': false},
        {'text': 'Hybrid encryption', 'isCorrect': true},
        {'text': 'Encoding algorithms', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does a digital certificate help with?',
      'answers': [
        {'text': 'Compressing web traffic', 'isCorrect': false},
        {'text': 'Verifying a website’s identity', 'isCorrect': true},
        {'text': 'Running scripts securely', 'isCorrect': false},
        {'text': 'Generating strong passwords', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'When should encryption keys be rotated?',
      'answers': [
        {'text': 'Every 10 years', 'isCorrect': false},
        {'text': 'When a data breach occurs or regularly per policy', 'isCorrect': true},
        {'text': 'Only at user request', 'isCorrect': false},
        {'text': 'Once during initial setup', 'isCorrect': false},
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
