import 'package:flutter/material.dart';

class Quiz8Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz8Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the primary threat in software integrity failures?',
      'answers': [
        {'text': 'UI glitches', 'isCorrect': false},
        {'text': 'Unintentional typos', 'isCorrect': false},
        {'text': 'Unauthorized modifications to code or data', 'isCorrect': true},
        {'text': 'Misspelled variables', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What can cause data tampering during transit?',
      'answers': [
        {'text': 'HTTPS enabled', 'isCorrect': false},
        {'text': 'End-to-end encryption', 'isCorrect': false},
        {'text': 'Using unencrypted HTTP connections', 'isCorrect': true},
        {'text': 'Using JWT tokens', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Why is code signing important?',
      'answers': [
        {'text': 'For visual branding', 'isCorrect': false},
        {'text': 'To verify software is from a trusted source', 'isCorrect': true},
        {'text': 'To prevent ad popups', 'isCorrect': false},
        {'text': 'To speed up compilation', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is a supply chain attack example?',
      'answers': [
        {'text': 'SQL injection', 'isCorrect': false},
        {'text': 'Man-in-the-middle attack', 'isCorrect': false},
        {'text': 'Compromised open-source package update', 'isCorrect': true},
        {'text': 'XSS from a user form', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What’s the risk of using a CI/CD pipeline with no access control?',
      'answers': [
        {'text': 'Slower build times', 'isCorrect': false},
        {'text': 'Untracked logs', 'isCorrect': false},
        {'text': 'Unauthorized code injection', 'isCorrect': true},
        {'text': 'Styling bugs', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Why is verifying software dependencies important?',
      'answers': [
        {'text': 'For better UI consistency', 'isCorrect': false},
        {'text': 'To prevent licensing issues', 'isCorrect': false},
        {'text': 'To avoid malicious code injection', 'isCorrect': true},
        {'text': 'For app theme customization', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is binary planting?',
      'answers': [
        {'text': 'Installing backup files', 'isCorrect': false},
        {'text': 'Placing malicious executables where the OS might load them', 'isCorrect': true},
        {'text': 'Reinstalling corrupted software', 'isCorrect': false},
        {'text': 'Deploying apps via SSH', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which practice ensures integrity during deployment?',
      'answers': [
        {'text': 'Sending passwords in headers', 'isCorrect': false},
        {'text': 'Using unsigned files', 'isCorrect': false},
        {'text': 'Automating builds without validation', 'isCorrect': false},
        {'text': 'Verifying checksums and digital signatures', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'What’s a hash collision?',
      'answers': [
        {'text': 'Two files producing the same hash', 'isCorrect': true},
        {'text': 'Log overflow', 'isCorrect': false},
        {'text': 'URL duplication', 'isCorrect': false},
        {'text': 'Key mismatch in encryption', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is a good mitigation strategy for software integrity threats?',
      'answers': [
        {'text': 'Disable SSL', 'isCorrect': false},
        {'text': 'Use HTTP instead of HTTPS', 'isCorrect': false},
        {'text': 'Implement automated vulnerability scanning and secure update channels', 'isCorrect': true},
        {'text': 'Share passwords across developers', 'isCorrect': false},
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
