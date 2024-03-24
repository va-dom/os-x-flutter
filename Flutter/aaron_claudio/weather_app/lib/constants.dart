import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color lightPrimary = Color(0xFF4CAF50); // Green
  static const Color lightAccent = Color(0xFF009688); // Teal
  static const Color lightBackground = Colors.white;
  static const Color lightText = Colors.black87;
  static const Color lightIcon = Colors.black54;
  static const Color lightDivider = Colors.grey;

  // Dark Theme Colors
  static const Color darkPrimary = Color(0xFF388E3C); // Dark Green
  static const Color darkAccent = Color(0xFF00796B); // Dark Teal
  static const Color darkBackground = Color(0xFF121212); // Dark Grey
  static const Color darkText = Colors.white;
  static const Color darkIcon = Colors.white70;
  static Color darkDivider = Colors.grey.shade600;
}

class AppStrings {
  static const String appName = 'MyApp';
  static const String welcomeMessage = 'Welcome to MyApp!';
  static const String errorOccurred =
      'An error occurred. Please try again later.';
}

// class AppTextStyles {
//   static const TextStyle titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
//   static const TextStyle bodyTextStyle = TextStyle(fontSize: 16, color: Colors.black87);
// }

// class AppConstants {
//   static const double defaultPadding = 16.0;
//   static const double borderRadius = 8.0;
//   static const int animationDuration = 300; // in milliseconds
// }

// class APIConstants {
//   static const String baseUrl = 'https://api.example.com';
//   static const String loginEndpoint = '/auth/login';
//   static const String userProfileEndpoint = '/user/profile';
// }

// class AppIcons {
//   static const String homeIcon = 'assets/icons/home.svg';
//   static const String profileIcon = 'assets/icons/profile.svg';
// }

// enum UserType { admin, user, moderator }
