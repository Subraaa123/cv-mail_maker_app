






import 'dart:io';

import 'package:cv_mail_maker_project/layout/home_layout.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/Skills.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/achivement.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/add_image.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/experiance.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/language.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/personal_info.dart';
import 'package:cv_mail_maker_project/modules/basic_screens/home_screene.dart';
import 'package:cv_mail_maker_project/modules/basic_screens/saved_screene.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/qualification.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/new_cv.dart';
import 'package:cv_mail_maker_project/pdf.dart';
import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:cv_mail_maker_project/shared/components/constants.dart';
import 'package:cv_mail_maker_project/test.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';


class CVMakerScreene extends StatefulWidget {

   CVMakerScreene({Key? key,   }) : super(key: key);

  @override
  _CVMakerScreeneState createState() => _CVMakerScreeneState();
}
class _CVMakerScreeneState extends State<CVMakerScreene> {
  Color mainColor = Color(0xFF252c4a);

  var fullNameController = TextEditingController();
  var ProfessionController =TextEditingController();
  var EmailController =TextEditingController();
  var DateController =TextEditingController();
  var NationalityController =TextEditingController();
  var AddressController =TextEditingController();
  var NumberController=TextEditingController();
  var SkillsController=TextEditingController();
  var LanguageController=TextEditingController();
  var OrgNameController=TextEditingController();
  var DesigniationController=TextEditingController();
  var JoiningController=TextEditingController();
  var EndController=TextEditingController();
  var AchivementController=TextEditingController();
   late bool enabled = false;
   var pageIndex =0;
  void initState() {
    // TODO: implement initState
    super.initState();
    creatDataBase();
  }
  late Database database;
  PageController? controller = PageController(initialPage: 0);
  int curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder:(context) =>HomeLayout()));
          },
              icon: Icon(Icons.cancel_outlined,
              color: Colors.white,
              size: 30,),
          )
        ],
        leadingWidth: 150,
        leading: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 15,),
              Text(
                'CV Maker',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,


                ),
              ),

            ],
          ),
        ),
        backgroundColor: mainColor,


      ),

        body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SButton(text: 'Persenal Info',
                      pressed: (){
                    setState(() {
                      controller!.jumpToPage(0);
                      curentIndex==0;
                    });
                      },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SButton(
                      text: 'Skills',
                      pressed: (){
                        controller!.jumpToPage(1);
                        curentIndex==1;
                      }
                      ),
                  SizedBox(
                    width: 20,
                  ),

                  SButton(
                      text: 'Language',
                      pressed: (){
                        controller!.jumpToPage(2);
                      }
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SButton(
                      text: 'Experiance',
                      pressed: (){
                        controller!.jumpToPage(3);
                      }
                  ),
                  SizedBox(
                    width: 20,
                  ),

                ],
              ),
            ),
            Expanded(
              child: PageView(
                physics:  NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  PersonalInfoScreene(
                      fullNameController: fullNameController,
                    AddressController: AddressController,
                    DateController: DateController,
                    EmailController: EmailController,
                    NationalityController: NationalityController,
                    ProfessionController: ProfessionController,
                    NumberContoller: NumberController,

                  ),
                  SkillsScreene(
                    SkillsController: SkillsController,
                  ),
                  LanguageScreene(
                    LanguageController: LanguageController,
                  ),
                  Achivements(
                      AchivementController: AchivementController),

                  ExpirienceScreene(
                    DesigniationController: DesigniationController,
                    EndController: EndController,
                    JoiningController: JoiningController,
                    OrgNameController: OrgNameController,
                  ),



                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NBbutton(pageIndex: pageIndex,
                    pressed: (){
                      setState(() {
                        pageIndex==0?pageIndex:pageIndex-=1;
                      });
                      print(controller!.page);
                      controller!.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
                    },
                    text: 'Back',
                  iconFirst: Icons.arrow_back_ios

                ),
                NBbutton(pageIndex: 1,
                    pressed: () {
                      setState(() {
                        if(pageIndex!=4){
                          pageIndex+=1;
                        }
                        else{
                          _creatPDF(name: fullNameController.text,
                          skills: SkillsController.text,
                          nationality: NationalityController.text,
                          language: LanguageController.text,
                          date: DateController.text,
                          address: AddressController.text,
                          email: EmailController.text,
                           phone: NumberController.text,
                          profession: ProfessionController.text,
                            designiation: DesigniationController.text,
                            end: EndController.text,
                            joining: JoiningController.text,
                            orgname: OrgNameController.text,
                            achivement: AchivementController.text
                          );
                          insertDatabaseCvs(
                              name: fullNameController.text ,
                              profession: ProfessionController.text,
                              email: EmailController.text,
                            address: AddressController.text,
                            date: DateController.text,
                            phone: NumberController.text,
                            language:LanguageController.text,
                            nationality: NationalityController.text,
                            skills: SkillsController.text,
                            achivement: AchivementController.text

                          );
                          insertDatabaseExperience(
                              orgname: OrgNameController.text,
                              designiation: DesigniationController.text,
                              joining: JoiningController.text,
                              end: EndController.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context) =>HomeLayout()));
                          getDataFromDatabaseCvs(database).then((value) {
                            Cvs = value;
                            print(Cvs);
                          });
                          getDataFromDatabaseExperience(database).then((value) {
                            Experience = value;
                            print(Experience);
                          });



                        }

                      });

                      controller!.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);

                    },
                    text: 'Next',
                  iconSecond: Icons.arrow_forward_ios

                ),
              ],
            ),
          ],
        ),
      )
    );
  }


  void creatDataBase() async{
    database =await openDatabase(
      'CvData.db',
      version: 1,
      onCreate: (database,version){
        database.execute(
            'Create table Cvs('
                'id INTEGER PRIMARY KEY,'
                'name Text,'
                'profession Text,'
                'email Text,'
                'phone Text,'
                'date Text,'
                'nationality Text,'
                'address Text,'
                'skills Text,'
                'language Text,'
                'achivement Text)'
        ).then((value) {
          print('table created');
        }).catchError((error){
          print('error in creating table ${error.toString()}');

        });
        database.execute(
            'Create table experience('
                'id INTEGER PRIMARY KEY,'
                'orgname Text,'
                'designiation Text,'
                'joining Text,'
                'end Text) '
        ).then((value) {
          print('experience table created');
        }).catchError((error){
          print('error in creating experience  table ${error.toString()}');

        });

        print('data base was created');

      },
      onOpen: (database){
        getDataFromDatabaseCvs(database).then((value) {
          Cvs = value;
          print(Cvs);

        });
        getDataFromDatabaseExperience(database).then((value) {
          Experience = value;
          print(Experience);

        });

        print('datbase opned');

      },



    );

  }


  Future<List<Map>> getDataFromDatabaseCvs(database)async
  {
    return await  database.rawQuery('SELECT * FROM Cvs');
  }
  Future<List<Map>> getDataFromDatabaseExperience(database)async
  {
    return await  database.rawQuery('SELECT * FROM experience');
  }

  Future insertDatabaseCvs({
    required String name,
    required String profession,
    required String email,
    required String phone,
    required String date,
    required String nationality,
    required String address,
    required String skills,
    required String language,
    required String achivement

  })async
  {
    return await database.transaction((txn)
    {
      txn.rawInsert('INSERT INTO Cvs(name,profession,email,phone,date,nationality,address,skills,language,achivement)'
          ' VALUES("$name","$profession","$email","$phone","$date","$nationality","$address","$skills","$language","$achivement")')
          .then((value)
      {
        print('$value insert seccefuly');
      }).catchError((error){
        print(' error when insert in table ${error.toString()}');
      });
      return null;
    }
    );

  }

  Future insertDatabaseExperience({
    required String orgname,
    required String designiation,
    required String joining,
    required String end,
  })async
  {
    return await database.transaction((txn)
    {
      txn.rawInsert('INSERT INTO experience(orgname,designiation,joining,end) '
          'VALUES("$orgname","$designiation","$joining","$end")')
          .then((value)
      {
        print('$value insert seccefuly');
      }).catchError((error){
        print(' error when insert in table ${error.toString()}');
      });
      return null;
    }
    );

  }

  final pdf = pw.Document();

  _creatPDF({
    required String name,

    required String profession,
    required String email ,
    required String phone ,
    required String date ,
    required String nationality ,
    required String address ,
    required String skills ,
    required String language,
    required String orgname,
    required String designiation,
    required String joining,
    required String end,
    required String achivement


  }) async {
    final emoji = await PdfGoogleFonts.notoColorEmoji();

    pdf.addPage(
      pw.Page(

          theme: pw.ThemeData.withFont(
            base: await PdfGoogleFonts.openSansRegular(),
            bold: await PdfGoogleFonts.openSansBold(),
            icons: await PdfGoogleFonts.materialIcons(),

          ),


          build: (pw.Context context) =>
              pw.Row(
                mainAxisAlignment:  pw.MainAxisAlignment.start,
                children: [
                  pw.Container(
                    color:PdfColors.grey,
                    width: 180,
                    height:500,

                    child: pw.Padding(
                      padding:  pw.EdgeInsets.all(10.0),
                      child: pw.Column(
                        mainAxisSize:  pw.MainAxisSize.max,
                        children: [
                          pw.Container(
                            width: 60,
                            height: 60,
                            color: PdfColors.blueGrey900
                          ),

                          pw.Text('$name'),
                          pw.Text('$profession'),


                          pw.Container(
                            color: PdfColors.black,
                            width: 100,
                            height: 1,
                          ),
                          pw.Text('contact detail'),
                          pw.Container(
                            color: PdfColors.white,
                            width: 100,
                            height: 1,
                          ),
                          pw.Row(
                            children: [
                              pw.Text('✉',

                                style: pw.TextStyle(
                                    color: PdfColors.white,
                                    fontFallback: [emoji],
                                  fontSize: 25),),
                              pw.SizedBox(width: 10,),
                              pw.Text('$email'),
                            ],
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Row(
                            children: [
                              pw.Text('📞',
                              style: pw.TextStyle(
                                fontFallback: [emoji],
                              )),
                              pw.SizedBox(width: 10,),
                              pw.Text('$phone'),
                            ],
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Row(
                            children: [
                              pw.Text('📍',
                              style: pw.TextStyle(
                                fontFallback: [emoji],
                              )),
                              pw.SizedBox(width: 10,),
                              pw.Text('$address'),
                            ],
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Row(
                            children: [
                              pw.Text('📅',
                                style: pw.TextStyle(color: PdfColors.black,
                                  fontFallback: [emoji],),),
                              pw.SizedBox(width: 10,),
                              pw.Text('$date'),
                            ],
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Row(
                            children: [
                              pw.Text('🚩',
                              style: pw.TextStyle(
                                fontFallback: [emoji],
                              )),
                              pw.SizedBox(width: 10,),
                              pw.Text('$nationality'),
                            ],
                          ),
                          pw.SizedBox(
                            height: 10,
                          ),
                          pw.Text('Languages'),
                          pw.Container(
                            color: PdfColors.white,
                            width: 100,
                            height: 1,
                          ),
                          pw.Row(
                            children: [
                              pw.Text('$language'.replaceAll(',',' \n')),
                            ],
                          ),
                          pw.Text('Skills'),
                          pw.Container(
                            color: PdfColors.white,
                            width: 100,
                            height: 1,
                          ),
                          pw.Row(
                            children: [
                              pw.Text('$skills'.replaceAll(',',' \n')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  pw.SizedBox(
                    width: 10,
                  ),
                  pw.Column(
                    mainAxisAlignment:  pw.MainAxisAlignment.start,

                    children: [
                      pw.SizedBox(height: 120,),
                      pw.Container(
                        padding:  pw.EdgeInsets.only(
                          bottom: 5, // Space between underline and text
                        ),
                        decoration:  pw.BoxDecoration(
                            border:  pw.Border(bottom:  pw.BorderSide(
                              color: PdfColors.black,
                              width: 1.0, // Underline thickness
                            ))
                        ),
                        child:
                        pw.Text(
                          "Work Experience",
                          style:  pw.TextStyle(
                            color: PdfColors.black,
                          ),
                        ),
                      ),
                      pw.SizedBox(
                        height: 10,
                      ),
                      pw.Text('From: $joining To $end',style: pw.TextStyle(fontSize: 20)),
                      pw.Text('$orgname \n',style: pw.TextStyle(fontSize: 18)),
                      pw.Text('$designiation',style: pw.TextStyle(fontSize: 15)),
                      pw.SizedBox(
                        height: 10,
                      ),
                      pw.Container(
                        padding:  pw.EdgeInsets.only(
                          bottom: 5, // Space between underline and text
                        ),
                        decoration:  pw.BoxDecoration(
                            border:  pw.Border(bottom:  pw.BorderSide(
                              color: PdfColors.black,
                              width: 1.0, // Underline thickness
                            ))
                        ),
                        child:  pw.Text(
                          "Achivements & Awards",
                          style:  pw.TextStyle(
                            color: PdfColors.black,
                          ),
                        ),
                      ),
                      pw.Text('$achivement'.replaceAll(',', '\n'),style: pw.TextStyle(fontSize: 18)),


                    ],
                  )
                ],
              ),

          pageFormat: PdfPageFormat.a4
      ),
    );
    saveAndLaunchFile(pdf, 'CV $name');
  }

}