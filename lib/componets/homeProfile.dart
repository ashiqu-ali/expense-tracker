import 'package:flutter/material.dart';
import '../utils/style.dart';

class HomeProfile extends StatelessWidget {
  const HomeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/icons/user.png"),
              SizedBox(width: xsmall),
              Text("Welcome Ashiq", style: heading2,)
            ],
          ),
          Icon(Icons.notifications_none_rounded, color: icon, size: medium)
        ],
      ),
    );
  }
}
