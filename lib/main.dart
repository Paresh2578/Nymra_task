import 'package:demo_check/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:demo_check/screens/payment_screen.dart';
import 'package:demo_check/screens/profile_screen.dart';
import 'package:demo_check/screens/story_upload_screen.dart';
import 'package:demo_check/screens/video_post_screen.dart';
import 'package:demo_check/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
