import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/presentation/screens/Auth/sing_in_screen.dart';
import 'package:task_manager/presentation/utils/app_color.dart';

PreferredSizeWidget get profileAppBar {
  return AppBar(
    backgroundColor: AppColors.themColor,
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(),
        const SizedBox(
          width: 10,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rabbil hasan",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Text(
                "rabbil@gmail.com",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                TaskManager.navigatorKey.currentState!.context,
                MaterialPageRoute(
                  builder: (context) => SingInScreen(),
                ),
                (route) => false);
          },
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
