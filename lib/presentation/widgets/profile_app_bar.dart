import 'package:flutter/material.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/presentation/controllers/auth_controller.dart';
import 'package:task_manager/presentation/screens/Auth/sing_in_screen.dart';
import 'package:task_manager/presentation/utils/app_color.dart';

PreferredSizeWidget get profileAppBar {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: AppColors.themColor,
    title: GestureDetector(
      onTap: (){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           CircleAvatar(
          ),
          const SizedBox(
            width: 10,
          ),
           Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AuthController.userData!.fullName,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                Text(
                  "${AuthController.userData!.email}",
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
              AuthController.clearUserData();
      
              Navigator.pushAndRemoveUntil(
                  TaskManager.navigatorKey.currentState!.context,
                  MaterialPageRoute(
                    builder: (context) => const SingInScreen(),
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
    ),
  );
}
