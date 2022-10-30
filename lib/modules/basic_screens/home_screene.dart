import 'package:cv_mail_maker_project/layout/cv_maker.dart';
import 'package:cv_mail_maker_project/modules/email_builder/mail_builder_screene.dart';
import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:cv_mail_maker_project/shared/components/constants.dart';


import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreene extends StatefulWidget {
  const HomeScreene({Key? key}) : super(key: key);

  @override
  _HomeScreeneState createState() => _HomeScreeneState();
}

class _HomeScreeneState extends State<HomeScreene> {
  Color mainColor = Color(0xFF252c4a);




  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body:
       Container(
         color: mainColor,
         width: double.infinity,

         height: 200,
         child: Padding(
           padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 2),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Row(

                 children: [
                   Expanded(child: Column(
                     children: [
                       SizedBox(
                         height: 20,
                       ),
                       FunctionButton(
                         text: 'Create CV',
                           image: 'cv.png',
                       color: mainColor,
                         pressed: (){
                           Navigator.push(context,
                             MaterialPageRoute(builder:(context) =>CVMakerScreene(




                             ),),);
                         }
                       ),
                       SizedBox(
                         height: 20,
                       ),


                       SizedBox(
                         height: 20,
                       ),



                     ],
                   )),
                   Container(
                     color: Colors.white,
                     width: 3,
                     height: 180,


                   ),
                   Expanded(child: Column(
                     children: [
                       SizedBox(
                         height: 20,
                       ),
                       FunctionButton(text: 'Create Letter',
                         image: 'mail.png',
                         color: mainColor,
                         pressed: (){
                           Navigator.push(context,
                             MaterialPageRoute(builder:(context) =>MailBuilderScreene(),),);
                         },
                       ),

                       SizedBox(
                         height: 20,
                       ),


                       SizedBox(
                         height: 20,
                       ),

                     ],
                   )),


                 ],

    ),
             ],
           ),
         ),
       ),
    );
  }



}




