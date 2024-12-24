import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:owasp_insight/screens/home.dart';
import 'package:owasp_insight/screens/splash.dart';
import 'firebase_options.dart';
import 'package:owasp_insight/screens/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OWASP Insight',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(87, 4, 24, 15),
        ),
        useMaterial3: true,
      ),
      home: const SplashScreenWrapper(),
    );
  }
}

/// Wrapper to handle the splash screen display
class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  bool _isSplashComplete = false;

  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _isSplashComplete = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isSplashComplete) {
      // Show the splash screen until the timer is complete
      return const SplashScreen();
    }

    // Once the splash timer is complete, check authentication status
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreen(); // Show splash screen while waiting for auth state
        }
        if (snapshot.hasData) {
          return const HomeScreen(); // User is logged in
        } else {
          return const AuthScreen(); // User is not logged in
        }
      },
    );
  }
}