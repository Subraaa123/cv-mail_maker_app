import 'dart:io';
import 'dart:typed_data';

import 'package:cv_mail_maker_project/layout/home_layout.dart';
import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:cv_mail_maker_project/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

import '../../shared/components/pdf.dart';

class MailBuilderScreene extends StatefulWidget {
  const MailBuilderScreene({Key? key}) : super(key: key);

  @override
  _MailBuilderScreeneState createState() => _MailBuilderScreeneState();
}

class _MailBuilderScreeneState extends State<MailBuilderScreene> {
  Color mainColor = Color(0xFF252c4a);
  var name =TextEditingController();
  var StudyorJobController = TextEditingController();
  var DomainController = TextEditingController();
  var TrainingNameController = TextEditingController();
  var CompanyNameController = TextEditingController();
  var JobController = TextEditingController();
  var DurationController = TextEditingController();
  var PdfNameController = TextEditingController();
  var StartDateController = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    creatDataBase();
  }
  late Database database;






  var _value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Mail Maker',
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: DropdownButton(

                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("Training Application"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Internship Request"),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text("Expert"),
                        value: 3,
                      ),
                    ],
                    onChanged: (value){
                      setState(() {
                        _value=value;
                      });
                    },
                    hint:Text("Mail Forms")
                ),
              ),
              Visibility(
                visible: _value==1 || _value==2?true:false,
                child:defaultFormField(contoller: PdfNameController,
                  type: TextInputType.text,
                  validate: (){},
                  label: 'PDF Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _value==1 || _value==2?true:false,
                child:defaultFormField(
                    contoller: StudyorJobController,
                    type: TextInputType.text,
                    validate: (){},
                    label: 'Study or Job',
                  prefix: Icons.work
                ),
              ),


              Visibility(
                visible: _value==1?true:false,
                child: SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible: _value==1?true:false,
                child:defaultFormField(contoller: CompanyNameController,
                  type: TextInputType.text,
                  validate: (){},
                  label: 'Company Name',
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _value==1 || _value==2?true:false,
                child:defaultFormField(contoller: DurationController,
                  type: TextInputType.text,
                  validate: (){},
                  label: 'duration',
                ),
              ),
              Visibility(
                visible: _value==2?true:false,
                child: SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible: _value==2?true:false,
                child:defaultFormField(contoller: StartDateController,
                  type: TextInputType.datetime,
                  validate: (){},
                  tab: (){
                  showDatePicker(context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100)).then((value) {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(value!);
                        StartDateController.text = formattedDate.toString();
                  });
                  },
                  label: 'Start Date',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _value==1?true:false,
                child:defaultFormField(
                  contoller: DomainController,
                  type: TextInputType.text,
                  validate: (){},
                  label: 'Domain',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _value==1?true:false,
                child:defaultFormField(contoller: TrainingNameController,
                  type: TextInputType.text,
                  validate: (){},
                  label: 'training name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _value==1?true:false,
                child:defaultFormField(contoller: JobController,
                  type: TextInputType.text,
                  validate: (){},
                  label: 'Job',
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NBbutton(

                      pressed: () async {
                        if(_value==1){
                          _creatPDF(
                              mail: demandeFormation(
                                  EtudeOUEmploi: StudyorJobController.text,
                                  DomaineFormation: DomainController.text,
                                  nomFormation: TrainingNameController.text,
                                  nomEtablissement: CompanyNameController.text,
                                  metier: JobController.text,
                                  duree: DurationController.text
                              ), PdfName:PdfNameController.text);
                          insertFormation(
                              companyName: CompanyNameController.text,
                            domaine: DomainController.text,
                            duration: DurationController.text,
                            job: JobController.text,
                            pdfName: PdfNameController.text,
                            studyOrJob: StudyorJobController.text,
                            trainingName: TrainingNameController.text,
                            mailForm: 'Training Application',
                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context) =>HomeLayout()));
                          getDataFromDatabaseFormation(database).then((value) {
                            MailFormation = value;
                            print(MailFormation);
                          }
                          );

                        }else if(_value==2){
                          _creatPDF(mail: demandeStage(
                            EtudeOUEmploi: StudyorJobController.text,
                            duree: DurationController.text,
                            dateDebut: StartDateController.text
                          ), PdfName: PdfNameController.text);
                          insertStage(
                              startDate: StartDateController.text,
                              duration: DurationController.text,
                              pdfName: PdfNameController.text,
                              studyOrJob: StudyorJobController.text,
                            mailForm:'Internship Request',


                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder:(context) =>HomeLayout()));
                          getDataFromDatabaseStage(database).then((value) {
                            MailStage = value;
                            print(MailStage);
                          }
                          );
                        }
                        else if(_value==3){
                          await deleteDatabase('MailData.db');
                          await deleteDatabase('CvData.db');
                        }

                      },
                      text: 'Next'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  final pdf=pw.Document();
  _creatPDF({
    required String mail,
    required String PdfName,
  }) async {
    pdf.addPage(
      pw.Page(
          build: (pw.Context context) => pw.Center(
            child: pw.Text('$mail', style: pw.TextStyle( fontSize: 30)),
          ),
          pageFormat: PdfPageFormat.a3
      ),
    );




    saveAndLaunchFile(pdf, '$PdfName.pdf');
  }
  void creatDataBase() async{
    database =await openDatabase(
      'MailData.db',
      version: 1,
      onCreate: (database,version){
        database.execute(
            'Create table stage(id INTEGER PRIMARY KEY,pdfName Text,studyOrJob Text,duration Text,startDate Text,mailForm Text) '
        ).then((value) {
          print('Stage table created');
        }).catchError((error){
          print('error in creating stage  table ${error.toString()}');

        });
        database.execute(
            'Create table formation(id INTEGER PRIMARY KEY,pdfName Text,studyOrJob Text,duration Text,domaine Text,trainingName Text,companyName Text,job Text,mailForm Text) '
        ).then((value) {
          print('Formation table created');
        }).catchError((error){
          print('error in creating formation  table ${error.toString()}');

        });


        print('data base was created');

      },
      onOpen: (database){
        getDataFromDatabaseStage(database).then((value) {
          MailStage = value;
          print(MailStage);

        });
        getDataFromDatabaseFormation(database).then((value) {
          MailFormation = value;
          print(MailFormation);

        });
        print('datbase opned');

      },


    );

  }
  Future<List<Map>> getDataFromDatabaseStage(database)async
  {
    return await  database.rawQuery('SELECT * FROM stage');
  }
  Future<List<Map>> getDataFromDatabaseFormation(database)async
  {
    return await  database.rawQuery('SELECT * FROM formation');
  }
 // pdfName Text,studyOrJob Text,duration Text,startDate Text
  Future insertStage({
    required String pdfName,
    required String studyOrJob,
    required String duration,
    required String startDate,
    required String mailForm,
  })async
  {
    return await database.transaction((txn)
    {
      txn.rawInsert('INSERT INTO stage(pdfName,studyOrJob,duration,startDate,mailForm) '
          'VALUES("$pdfName.pdf","$studyOrJob","$duration","$startDate","$mailForm")')
          .then((value)
      {
        print('$value insert into stage  seccefuly');
      }).catchError((error){
        print(' error when insert in stage table ${error.toString()}');
      });
      return null;
    }
    );

  }
  //pdfName Text,studyOrJob Text,duration Text,domaine Text,trainingName Text,companyName Text,job Text
  Future insertFormation({
    required String pdfName,
    required String studyOrJob,
    required String duration,
    required String domaine,
    required String trainingName,
    required String companyName,
    required String job,
    required String mailForm,
  })async
  {
    return await database.transaction((txn)
    {
      txn.rawInsert('INSERT INTO formation(pdfName,studyOrJob,duration,domaine,trainingName,companyName,job,mailForm) '
          'VALUES("$pdfName.pdf","$studyOrJob","$duration","$domaine","$trainingName","$companyName","$job","$mailForm")')
          .then((value)
      {
        print('$value insert formation seccefuly');
      }).catchError((error){
        print(' error when insert in formation table ${error.toString()}');
      });
      return null;
    }
    );

  }
}
