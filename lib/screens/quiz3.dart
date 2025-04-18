import 'package:flutter/material.dart';

class Quiz3Screen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<Quiz3Screen> {
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Which of the following is not an injection vulnerability?',
      'answers': [
        {'text': 'SQL Injection', 'isCorrect': false},
        {'text': 'Command Injection', 'isCorrect': false},
        {'text': 'XML Injection', 'isCorrect': false},
        {'text': 'Buffer Overflow', 'isCorrect': true},
      ],
    },
    {
      'questionText': 'What is the main goal of a SQL injection attack?',
      'answers': [
        {'text': 'Change frontend styling', 'isCorrect': false},
        {'text': 'Trick the user into clicking malicious links', 'isCorrect': false},
        {'text': 'Execute unauthorized database queries', 'isCorrect': true},
        {'text': 'Disable browser protections', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of the following is safest against injection?',
      'answers': [
        {'text': 'Concatenated SQL statements', 'isCorrect': false},
        {'text': 'User-controlled commands', 'isCorrect': false},
        {'text': 'Parameterized queries', 'isCorrect': true},
        {'text': 'String-based queries', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which programming function is vulnerable to command injection if misused?',
      'answers': [
        {'text': 'print()', 'isCorrect': false},
        {'text': 'os.system()', 'isCorrect': true},
        {'text': 'len()', 'isCorrect': false},
        {'text': 'sort()', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What’s the impact of LDAP injection?',
      'answers': [
        {'text': 'Access to internal logs', 'isCorrect': false},
        {'text': 'Bypassing authentication or modifying directory queries', 'isCorrect': true},
        {'text': 'Redirecting to malicious sites', 'isCorrect': false},
        {'text': 'Slowing down database servers', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which type of injection is associated with NoSQL databases like MongoDB?',
      'answers': [
        {'text': 'XSS', 'isCorrect': false},
        {'text': 'Object injection', 'isCorrect': true},
        {'text': 'DLL injection', 'isCorrect': false},
        {'text': 'SQL injection', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What is one way to test for injection vulnerabilities?',
      'answers': [
        {'text': "Entering special characters like ' OR 1=1 --", 'isCorrect': true},
        {'text': 'Using browser developer tools', 'isCorrect': false},
        {'text': 'Running antivirus software', 'isCorrect': false},
        {'text': 'Changing screen resolution', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What role do input sanitization and validation play in injection protection?',
      'answers': [
        {'text': 'Make the UI cleaner', 'isCorrect': false},
        {'text': 'Enhance password strength', 'isCorrect': false},
        {'text': 'Block or escape malicious input', 'isCorrect': true},
        {'text': 'Encrypt API responses', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'What can command injection allow attackers to do?',
      'answers': [
        {'text': 'Add browser extensions', 'isCorrect': false},
        {'text': 'Download confidential files', 'isCorrect': true},
        {'text': 'Log user keystrokes', 'isCorrect': false},
        {'text': 'Perform SQL queries', 'isCorrect': false},
      ],
    },
    {
      'questionText': 'Which of these helps detect injection vulnerabilities early?',
      'answers': [
        {'text': 'Frontend rendering', 'isCorrect': false},
        {'text': 'Linter warnings', 'isCorrect': false},
        {'text': 'Security code review', 'isCorrect': true},
        {'text': 'Image compression', 'isCorrect': false},
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
