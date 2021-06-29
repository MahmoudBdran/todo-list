import 'package:flutter/material.dart';
import 'package:todo_list/screens/add_task_screen.dart';
import '../main.dart';

class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final int id;
  final Function setPage;

  const CustomNavItem({this.setPage, this.icon, this.id});

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // currentIndex = id;
        // setPage();
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddTask_screen(),));
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: 25,

          backgroundColor: currentIndex == id
              ? Colors.white
              : Colors.transparent,
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
            // color: currentIndex == id
            //     ? Colors.black
            //     : Colors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
