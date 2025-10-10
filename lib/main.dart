import 'package:flutter/material.dart';
import 'package:musicappflutter/pages/home_pages.dart';
import 'package:musicappflutter/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:musicappflutter/model/playlist_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePages(),
          theme: themeProvider.themeData,
        );
      },
    );
  }
}
