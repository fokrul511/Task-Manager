import 'package:flutter/material.dart';
import 'package:task_manager/presentation/screens/new_task_screen.dart';
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
  List<Widget> _screens = [
    NewTaskScreen(),
    Center(child: Text("Completed"),),
    NewTaskScreen(),
    NewTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentSelectedIndex,
        selectedItemColor: AppColors.themColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          _currentSelectedIndex = index;
          if (mounted) {
            setState(() {});
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.file_copy_outlined), label: "New"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmarks_outlined), label: "Completed"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Cancled"),
        ],
      ),
      body: _screens[_currentSelectedIndex],
    );
  }
}
