import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages Page')),
      body: Center(
        child: Text(
          'Check your Messages here!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}




class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(
        child: Text(
          'Welcome to your Profile!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
