import 'package:flutter/material.dart';

import 'components/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Flutter News',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.blueAccent),
        ),
        centerTitle: true,
      ),
      body: const NewsListScreen(),
    );
  }
}
