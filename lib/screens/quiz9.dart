import 'package:flutter/material.dart';

class Quiz9Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz9Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Why is log tampering dangerous?',
      'answers': [
        {'text': 'It improves app performance', 'isCorrect': false},
        {'text': 'It hides evidence of attacks or unauthorized access', 'isCorrect': true},
        {'text': 'It increases disk space', 'isCorrect': false},
        {'text': 'It breaks UI design', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is a sign of inadequate monitoring?',
      'answers': [
        {'text': 'Alert fatigue', 'isCorrect': false},
        {'text': 'Detecting every event', 'isCorrect': false},
        {'text': 'Failing to notice a breach for weeks', 'isCorrect': true},
        {'text': 'Receiving false positives', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What kind of log should NOT be publicly accessible?',
      'answers': [
        {'text': 'Application usage stats', 'isCorrect': false},
        {'text': 'Authentication and access logs', 'isCorrect': true},
        {'text': 'General error messages', 'isCorrect': false},
        {'text': 'System uptime', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Why should logs include timestamps and unique identifiers?',
      'answers': [
        {'text': 'To improve UI responsiveness', 'isCorrect': false},
        {'text': 'To make logs SEO-friendly', 'isCorrect': false},
        {'text': 'To trace events and incidents accurately', 'isCorrect': true},
        {'text': 'To reduce memory usage', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which logging practice violates user privacy?',
      'answers': [
        {'text': 'Logging failed logins', 'isCorrect': false},
        {'text': 'Logging full credit card numbers', 'isCorrect': true},
        {'text': 'Logging API request counts', 'isCorrect': false},
        {'text': 'Logging login attempts', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the main use of a SIEM (Security Information and Event Management) system?',
      'answers': [
        {'text': 'Create user dashboards', 'isCorrect': false},
        {'text': 'Centralize logs and detect anomalies', 'isCorrect': true},
        {'text': 'Encrypt all logs', 'isCorrect': false},
        {'text': 'Host static assets', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What’s the consequence of not storing logs securely?',
      'answers': [
        {'text': 'UI freezes', 'isCorrect': false},
        {'text': 'Loss of metadata', 'isCorrect': false},
        {'text': 'Log exposure or tampering by attackers', 'isCorrect': true},
        {'text': 'Poor animation performance', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is a good retention policy for security logs?',
      'answers': [
        {'text': 'Store logs only for 24 hours', 'isCorrect': false},
        {'text': 'Keep logs indefinitely', 'isCorrect': false},
        {'text': 'Retain logs as per regulatory or compliance requirements', 'isCorrect': true},
        {'text': 'Clear logs on each restart', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Why is alert tuning necessary in monitoring?',
      'answers': [
        {'text': 'To disable notifications', 'isCorrect': false},
        {'text': 'To avoid unnecessary alerts and false positives', 'isCorrect': true},
        {'text': 'To pause logging', 'isCorrect': false},
        {'text': 'To encrypt logs', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What type of event should always be logged in secure apps?',
      'answers': [
        {'text': 'UI layout change', 'isCorrect': false},
        {'text': 'Failed login attempts', 'isCorrect': true},
        {'text': 'Image uploads', 'isCorrect': false},
        {'text': 'Font size adjustments', 'isCorrect': false},
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
