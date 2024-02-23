import 'package:flutter/material.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({super.key});

  @override
  State<SingInScreen> createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
       child: Column(children: []),
      ),
    );
  }
}
