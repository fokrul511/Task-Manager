import 'package:flutter/material.dart';
import 'package:task_manager/presentation/utils/app_color.dart';

class MainBottomNavigationScreen extends StatefulWidget {
  const MainBottomNavigationScreen({super.key});

  @override
  State<MainBottomNavigationScreen> createState() =>
      _MainBottomNavigationScreenState();
}

class _MainBottomNavigationScreenState
    extends State<MainBottomNavigationScreen> {
  int _currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentSelectedIndex,
        selectedItemColor: AppColors.themColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        onTap: (index) {
          _currentSelectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        ],
      ),
    );
  }
}
