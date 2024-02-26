import 'package:flutter/material.dart';
import 'package:full_api_integration/providers/post_provider.dart';
import 'package:full_api_integration/providers/user_provider.dart';
import 'package:full_api_integration/utils/utils.dart';
import 'package:full_api_integration/view/home/home_screen.dart';
import 'package:full_api_integration/view/user_information/user_information_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Utils.initScreenSize(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PostProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Api Test',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(scrolledUnderElevation: 0.0),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserInformationScreen(),
      ),
    );
  }
}
