import 'package:flutter/material.dart';
import 'package:musicappflutter/pages/home_pages.dart';
import 'package:musicappflutter/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:musicappflutter/components/my_drawer.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePages(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
