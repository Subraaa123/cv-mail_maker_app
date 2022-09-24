import 'package:cv_mail_maker_project/modules/email_builder/mails_historique.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/new_cv.dart';
import 'package:flutter/material.dart';

class SavedScreene extends StatefulWidget {
  const SavedScreene({Key? key}) : super(key: key);

  @override
  State<SavedScreene> createState() => _SavedScreeneState();
}

class _SavedScreeneState extends State<SavedScreene> {
  PageController? controller = PageController(initialPage: 0);
  Color mainColor = Color(0xFF252c4a);
  Color first=Colors.black;
  Color second =Color(0xFF252c4a);
  double wid =2.00;
  double wid2=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        width: double.infinity,
        child: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              setState(() {
                controller!.jumpToPage(0);
                first=Colors.black;
                second=mainColor;
                wid=2;
                wid2=0;

              });

            }, child: Container(
              padding: EdgeInsets.only(
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(
                  color: first,
                  width: wid, // Underline thickness
                ),),),
              child: Text('Resumes',
              style: TextStyle(
              color: first,
              fontSize: 25,
              fontWeight: FontWeight.bold,


              ),
              ),
            ),
            ),
            SizedBox(
              width: 10,
            ),
            TextButton(onPressed: (){
              setState(() {
                controller!.jumpToPage(1);
                second=Colors.black;
                first=mainColor;
                wid2=2;
                wid=0;
              });


            }, child: Container(
              padding: EdgeInsets.only(
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(
                  color: second,
                  width: wid2, // Underline thickness
                ),),),
              child: Text('Mails',
                style: TextStyle(
                  color: second,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,


                ),
              ),
            ),
            ),
      ]
        ),
        ),
      ),
      Expanded(
        child: PageView(
          physics:  NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            NewCv(),
            MailsHistorique(),



          ],
        ),
      ),

    ],
        ),




    ),
    );


  }
}

