import 'package:esewa_clone/feature/home/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        accentColor: Colors.green.withGreen(180).withRed(90),
        scaffoldBackgroundColor: Colors.grey.shade900.withOpacity(0.5),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
          elevation: 0,
          iconTheme: const IconThemeData(size: 50),
        ),
        chipTheme: ChipThemeData(
          selectedColor: Colors.green.withGreen(180).withRed(90),
          disabledColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.white),
          ),
          labelPadding: const EdgeInsets.only(
            left: 5,
            right: 30,
          ),
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all<Color>(
            Colors.green.withRed(10),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
