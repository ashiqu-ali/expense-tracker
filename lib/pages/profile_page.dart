import 'package:expense_tracker/utils/style.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(Icons.notifications_none)
        ],
      ),
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: medium),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  children: [
                    Image.asset("assets/icons/user.png",width:100,),
                    Text("Ashiqu Ali",style: heading1,),
                    Text("connect.ashiqu@gmail.com",style: heading3,),
                    SizedBox(height: xsmall),
                    const Chip(
                      backgroundColor: accent,
                        label: Text("Edit Profile"),
                    )
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 1,
                child: Column(
                  children: [

                  ],

            ))
          ],
        ),
      ),
    );
  }
}
