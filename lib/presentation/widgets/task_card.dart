import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title Will be here",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Discription Will be here"),
            Text("date: 12-11-2024"),
            Row(
              children: [
                Chip(
                  label: Text("New"),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outline_outlined)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
