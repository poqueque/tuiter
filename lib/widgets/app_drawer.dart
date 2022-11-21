import 'package:flutter/material.dart';
import 'package:tuiter/services/firebase_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //User icon
            const Icon(Icons.person),
            //User name
            Text(FirebaseService.instance.user?.displayName ?? "---")
            //User alias
            //Followers / Following
            //Link to profile page
            //Logout
          ],
        ),
      ),
    );
  }
}
