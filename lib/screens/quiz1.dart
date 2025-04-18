import 'package:flutter/material.dart';

class Quiz1Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz1Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Which of the following is NOT a symptom of broken access control?',
      'answers': [
        {'text': 'Unauthorized data exposure', 'isCorrect': false},
        {'text': 'Unauthorized function execution', 'isCorrect': false},
        {'text': 'Session fixation', 'isCorrect': false},
        {'text': 'Path traversal', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'What is a direct object reference?',
      'answers': [
        {'text': 'Indirect URL to a resource', 'isCorrect': false},
        {'text': 'Mapping user input to internal object references', 'isCorrect': true},
        {'text': 'A method of obfuscating URLs', 'isCorrect': false},
        {'text': 'Bypassing authentication', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What should be enforced server-side to prevent broken access control?',
      'answers': [
        {'text': 'UI-level restrictions', 'isCorrect': false},
        {'text': 'Client-side validations', 'isCorrect': false},
        {'text': 'Authentication rules', 'isCorrect': false},
        {'text': 'Authorization rules', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'What type of access control grants permissions based on conditions like location/time?',
      'answers': [
        {'text': 'Role-Based', 'isCorrect': false},
        {'text': 'Discretionary', 'isCorrect': false},
        {'text': 'Attribute-Based', 'isCorrect': true},
        {'text': 'Object-Based', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is the principle of least privilege?',
      'answers': [
        {'text': 'Grant full access to power users', 'isCorrect': false},
        {'text': 'Restrict access to minimum necessary permissions', 'isCorrect': true},
        {'text': 'Give all users admin rights', 'isCorrect': false},
        {'text': 'Disable all non-essential features', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'In an access control matrix, what do rows typically represent?',
      'answers': [
        {'text': 'Roles', 'isCorrect': false},
        {'text': 'Permissions', 'isCorrect': false},
        {'text': 'Subjects', 'isCorrect': true},
        {'text': 'Policies', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Why is client-side access control insecure?',
      'answers': [
        {'text': 'It’s harder to configure', 'isCorrect': false},
        {'text': 'It can be bypassed using dev tools', 'isCorrect': true},
        {'text': 'It reduces performance', 'isCorrect': false},
        {'text': 'It increases testing time', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is function-level access control?',
      'answers': [
        {'text': 'Limiting access to database queries', 'isCorrect': false},
        {'text': 'Restricting access to specific functions in the code', 'isCorrect': true},
        {'text': 'Securing physical access to servers', 'isCorrect': false},
        {'text': 'Monitoring access logs', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'How does vertical privilege escalation work?',
      'answers': [
        {'text': 'User accesses equal-level resources', 'isCorrect': false},
        {'text': 'Admin becomes a user', 'isCorrect': false},
        {'text': 'User gains higher-level access than assigned', 'isCorrect': true},
        {'text': 'User session expires prematurely', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'A user manipulates a URL to change their user ID from 1001 to 1002. What vulnerability does this indicate?',
      'answers': [
        {'text': 'XSS', 'isCorrect': false},
        {'text': 'CSRF', 'isCorrect': false},
        {'text': 'Broken Access Control', 'isCorrect': true},
        {'text': 'Insecure Direct Injection', 'isCorrect': false},
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
