import 'package:flutter/material.dart';

class Quiz4Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz4Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the primary cause of insecure design?',
      'answers': [
        {'text': 'Poor coding syntax', 'isCorrect': false},
        {'text': 'Lack of security consideration during design phase', 'isCorrect': true},
        {'text': 'Too many users', 'isCorrect': false},
        {'text': 'High server load', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is security by obscurity in design?',
      'answers': [
        {'text': 'Hiding implementation details instead of securing them properly', 'isCorrect': true},
        {'text': 'Using strong encryption', 'isCorrect': false},
        {'text': 'Designing open-source APIs', 'isCorrect': false},
        {'text': 'Publishing all backend code', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is a design flaw, not an implementation bug?',
      'answers': [
        {'text': 'Hardcoded credentials', 'isCorrect': false},
        {'text': 'Insecure architecture decision', 'isCorrect': true},
        {'text': 'Lack of input validation', 'isCorrect': false},
        {'text': 'Race conditions', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which phase is threat modeling usually performed in?',
      'answers': [
        {'text': 'Coding', 'isCorrect': false},
        {'text': 'Testing', 'isCorrect': false},
        {'text': 'Deployment', 'isCorrect': false},
        {'text': 'Design', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'Why is lack of rate limiting an insecure design decision?',
      'answers': [
        {'text': 'Slows down the app', 'isCorrect': false},
        {'text': 'Allows brute force or DoS attacks', 'isCorrect': true},
        {'text': 'Reduces storage', 'isCorrect': false},
        {'text': 'Breaks UI elements', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What should a secure design prioritize?',
      'answers': [
        {'text': 'Minimum memory usage', 'isCorrect': false},
        {'text': 'Clean code', 'isCorrect': false},
        {'text': 'Business logic without threat analysis', 'isCorrect': false},
        {'text': 'Defense-in-depth strategies', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'What is the result of skipping design reviews?',
      'answers': [
        {'text': 'Performance issues', 'isCorrect': false},
        {'text': 'UI bugs', 'isCorrect': false},
        {'text': 'Introduction of exploitable security flaws', 'isCorrect': true},
        {'text': 'Documentation errors', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is abuse case analysis used for?',
      'answers': [
        {'text': 'Handling hardware failures', 'isCorrect': false},
        {'text': 'Detecting how users might misuse the system', 'isCorrect': true},
        {'text': 'Avoiding null pointer exceptions', 'isCorrect': false},
        {'text': 'Creating better UI', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which design concept protects against single points of failure?',
      'answers': [
        {'text': 'Encryption', 'isCorrect': false},
        {'text': 'Logging', 'isCorrect': false},
        {'text': 'Redundancy', 'isCorrect': true},
        {'text': 'Authentication', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is an anti-pattern in secure design?',
      'answers': [
        {'text': 'Using design principles', 'isCorrect': false},
        {'text': 'Relying solely on client-side logic', 'isCorrect': true},
        {'text': 'Enforcing strong access control', 'isCorrect': false},
        {'text': 'Applying least privilege', 'isCorrect': false},
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
