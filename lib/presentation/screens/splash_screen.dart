import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/sing_in_screen.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveSinInScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SingInScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _moveSinInScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundWidget(
      child: const Center(
        child: AppLogo(),
      ),
    ));
  }
}

