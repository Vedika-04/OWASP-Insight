import 'package:flutter/material.dart';

class Quiz5Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz5Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is a common example of security misconfiguration?',
      'answers': [
        {'text': 'Strong password policy', 'isCorrect': false},
        {'text': 'Running services with unnecessary privileges', 'isCorrect': true},
        {'text': 'Enabling MFA', 'isCorrect': false},
        {'text': 'Using HTTPS', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What’s the risk of detailed error messages being shown to users?',
      'answers': [
        {'text': 'Better UX', 'isCorrect': false},
        {'text': 'Reveals sensitive internal information', 'isCorrect': true},
        {'text': 'Slower response times', 'isCorrect': false},
        {'text': 'Triggers CAPTCHA', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does a "default configuration" usually mean in security terms?',
      'answers': [
        {'text': 'Secure by default', 'isCorrect': false},
        {'text': 'Hardened automatically', 'isCorrect': false},
        {'text': 'Potentially insecure if not customized', 'isCorrect': true},
        {'text': 'Disabled by default', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which setting might cause directory listing vulnerability?',
      'answers': [
        {'text': 'Enabling server-side routing', 'isCorrect': false},
        {'text': 'Misconfigured web server', 'isCorrect': true},
        {'text': 'HTTPS redirect', 'isCorrect': false},
        {'text': 'JSON parsing', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Why is leaving debug mode enabled in production risky?',
      'answers': [
        {'text': 'Improves load time', 'isCorrect': false},
        {'text': 'May expose stack traces and internal variables', 'isCorrect': true},
        {'text': 'Breaks JavaScript', 'isCorrect': false},
        {'text': 'Disables CSS', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'How can container misconfiguration introduce risk?',
      'answers': [
        {'text': 'Slow container start-up', 'isCorrect': false},
        {'text': 'Allowing container to run as root', 'isCorrect': true},
        {'text': 'Missing app icon', 'isCorrect': false},
        {'text': 'Outdated UI framework', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following should be disabled in a secure production environment?',
      'answers': [
        {'text': 'Logging', 'isCorrect': false},
        {'text': 'Stack trace display', 'isCorrect': true},
        {'text': 'HTTPS', 'isCorrect': false},
        {'text': 'Authentication', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which tool helps detect security misconfigurations?',
      'answers': [
        {'text': 'Wireshark', 'isCorrect': false},
        {'text': 'OWASP ZAP', 'isCorrect': true},
        {'text': 'Paint', 'isCorrect': false},
        {'text': 'Curl', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What does the term "hardening" refer to?',
      'answers': [
        {'text': 'Improving UI security', 'isCorrect': false},
        {'text': 'Reducing attack surface by disabling unnecessary services', 'isCorrect': true},
        {'text': 'Running apps in full screen', 'isCorrect': false},
        {'text': 'Using dark mode', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'How can cloud misconfiguration lead to a breach?',
      'answers': [
        {'text': 'Slow loading time', 'isCorrect': false},
        {'text': 'Misconfigured S3 bucket made public', 'isCorrect': true},
        {'text': 'No login screen', 'isCorrect': false},
        {'text': 'Low-resolution images', 'isCorrect': false},
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
