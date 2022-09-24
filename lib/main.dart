
import 'package:cv_mail_maker_project/layout/home_layout.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/add_image.dart';
import 'package:cv_mail_maker_project/modules/email_builder/mail_builder_screene.dart';
import 'package:cv_mail_maker_project/modules/basic_screens/home_screene.dart';
import 'package:cv_mail_maker_project/test.dart';
import 'package:cv_mail_maker_project/test2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
      ThemeData(
          primaryColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.black),
            hintStyle: TextStyle(color: Colors.grey),
          ),

    ),


      debugShowCheckedModeBanner: false,
      home:HomeLayout (),

    );
  }

}