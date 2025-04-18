import 'package:flutter/material.dart';

class Quiz10Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz10Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What does SSRF allow an attacker to do?',
      'answers': [
        {'text': 'Redirect a user to another site', 'isCorrect': false},
        {'text': 'Trigger client-side XSS', 'isCorrect': false},
        {'text': 'Make the server send requests to internal or external systems', 'isCorrect': true},
        {'text': 'Upload files to the server', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Why is SSRF particularly dangerous in cloud environments?',
      'answers': [
        {'text': 'It can trigger CAPTCHA', 'isCorrect': false},
        {'text': 'It reveals secret environment variables', 'isCorrect': true},
        {'text': 'It logs out all users', 'isCorrect': false},
        {'text': 'It disables UI elements', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following targets is most at risk in SSRF attacks?',
      'answers': [
        {'text': 'Internal admin APIs', 'isCorrect': true},
        {'text': 'CSS files', 'isCorrect': false},
        {'text': 'JavaScript libraries', 'isCorrect': false},
        {'text': 'Client email addresses', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which header might be manipulated in SSRF attacks?',
      'answers': [
        {'text': 'Authorization', 'isCorrect': false},
        {'text': 'User-Agent', 'isCorrect': false},
        {'text': 'Host', 'isCorrect': true},
        {'text': 'Content-Type', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What kind of SSRF protection is most effective?',
      'answers': [
        {'text': 'Displaying a warning', 'isCorrect': false},
        {'text': 'Enabling user input echoing', 'isCorrect': false},
        {'text': 'Validating and whitelisting destination URLs', 'isCorrect': true},
        {'text': 'Logging requests only', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is Blind SSRF?',
      'answers': [
        {'text': 'When the attack fails', 'isCorrect': false},
        {'text': 'SSRF with no visible response to attacker', 'isCorrect': true},
        {'text': 'SSRF on the frontend', 'isCorrect': false},
        {'text': 'SSRF that only affects mobile apps', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'How can DNS rebinding be used with SSRF?',
      'answers': [
        {'text': 'To speed up requests', 'isCorrect': false},
        {'text': 'To change the font dynamically', 'isCorrect': false},
        {'text': 'To bypass hostname validation', 'isCorrect': true},
        {'text': 'To add session cookies', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which input field is most likely to be vulnerable to SSRF?',
      'answers': [
        {'text': 'Search bar', 'isCorrect': false},
        {'text': 'Contact form', 'isCorrect': false},
        {'text': 'Image URL fetcher', 'isCorrect': true},
        {'text': 'CAPTCHA', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the most secure way to prevent SSRF in applications that fetch external URLs?',
      'answers': [
        {'text': 'Use a proxy with strict allow-list', 'isCorrect': true},
        {'text': 'Use GET requests only', 'isCorrect': false},
        {'text': 'Limit request size', 'isCorrect': false},
        {'text': 'Require form submission', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What response behavior may indicate SSRF vulnerability?',
      'answers': [
        {'text': 'Redirecting to homepage', 'isCorrect': false},
        {'text': 'Internal service data in the response', 'isCorrect': true},
        {'text': '200 OK with no content', 'isCorrect': false},
        {'text': 'Timeout during client request', 'isCorrect': false},
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
    if (isCorrect) return Colors.green;
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
            ).toList(),
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
