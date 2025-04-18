import 'package:flutter/material.dart';

class Quiz6Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz6Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the danger of using outdated third-party libraries?',
      'answers': [
        {'text': 'Poor formatting', 'isCorrect': false},
        {'text': 'Potential known vulnerabilities', 'isCorrect': true},
        {'text': 'Slower typing speed', 'isCorrect': false},
        {'text': 'High resolution graphics', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'How often should component versions be reviewed in a secure pipeline?',
      'answers': [
        {'text': 'Once a year', 'isCorrect': false},
        {'text': 'Only when bugs appear', 'isCorrect': false},
        {'text': 'Regularly during updates or builds', 'isCorrect': true},
        {'text': 'After deployment', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the best way to track outdated software components?',
      'answers': [
        {'text': 'Code commenting', 'isCorrect': false},
        {'text': 'Manual changelog updates', 'isCorrect': false},
        {'text': 'Software Composition Analysis (SCA) tools', 'isCorrect': true},
        {'text': 'Rewriting the codebase', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is a common risk of using a plugin with no recent updates or maintainers?',
      'answers': [
        {'text': 'Increased documentation', 'isCorrect': false},
        {'text': 'High availability', 'isCorrect': false},
        {'text': 'Abandoned and insecure code', 'isCorrect': true},
        {'text': 'Better performance', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What type of license might introduce legal or security risks in third-party software?',
      'answers': [
        {'text': 'MIT', 'isCorrect': false},
        {'text': 'GPL', 'isCorrect': false},
        {'text': 'Unknown or proprietary license with no source', 'isCorrect': true},
        {'text': 'Apache-2.0', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the purpose of a dependency lock file (like package-lock.json)?',
      'answers': [
        {'text': 'Reduces file size', 'isCorrect': false},
        {'text': 'Prevents unauthorized editing', 'isCorrect': false},
        {'text': 'Freezes versions to avoid unplanned updates', 'isCorrect': true},
        {'text': 'Generates changelogs', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is a best practice to manage software dependencies securely?',
      'answers': [
        {'text': 'Use outdated libraries for compatibility', 'isCorrect': false},
        {'text': 'Blindly trust GitHub stars', 'isCorrect': false},
        {'text': 'Use signed packages from trusted sources', 'isCorrect': true},
        {'text': 'Disable dependency updates', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the risk of bundling unused components in production builds?',
      'answers': [
        {'text': 'Slower animations', 'isCorrect': false},
        {'text': 'Increased attack surface', 'isCorrect': true},
        {'text': 'Better font rendering', 'isCorrect': false},
        {'text': 'Stronger hashes', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'How can CI/CD pipelines reduce risks from outdated components?',
      'answers': [
        {'text': 'Delay updates', 'isCorrect': false},
        {'text': 'Force compilation errors', 'isCorrect': false},
        {'text': 'Automatically check for and alert on vulnerabilities', 'isCorrect': true},
        {'text': 'Disable package scanning', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is a zero-day vulnerability in the context of outdated components?',
      'answers': [
        {'text': 'A known bug with a patch', 'isCorrect': false},
        {'text': 'A vulnerability discovered before the vendor releases a fix', 'isCorrect': true},
        {'text': 'A harmless debug message', 'isCorrect': false},
        {'text': 'A phishing technique', 'isCorrect': false},
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
