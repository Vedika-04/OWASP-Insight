import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:owasp_insight/screens/auth.dart';
import 'package:owasp_insight/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimationLogo;
  late Animation<Offset> _slideAnimationText;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Initialize animations
    _initializeAnimations();

    // Start the animations
    _controller.forward();

    // Navigate after delay
    _navigateToNextScreen();
  }

  // Method to initialize animations
  void _initializeAnimations() {
    // Slide Animation for Logo
    _slideAnimationLogo = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Slide Animation for Text
    _slideAnimationText = Tween<Offset>(
      begin: const Offset(0, 1.5), // Start slightly below the logo
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Fade-In Animation
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  // Method to handle navigation after delay
  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // If user is logged in, navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      } else {
        // If user is not logged in, navigate to AuthScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const AuthScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo with Slide and Fade-In Effect
              _buildLogoAnimation(),

              // Animated Text (App Name)
              _buildTextAnimation(),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build logo animation
  Widget _buildLogoAnimation() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimationLogo,
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 20),
        width: 200,
        child: Image.asset('assets/images/logo.jpg'), // Make sure the asset path is correct
      ),
    );
  }

  // Method to build text animation
  Widget _buildTextAnimation() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimationText,
            child: child,
          ),
        );
      },
      child: const Text(
        'OWASP Insight',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w800,
          fontStyle: FontStyle.italic,
          color: Colors.white,
        ),
      ),
    );
  }
}
