

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:cv_mail_maker_project/pdf.dart';
import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:cv_mail_maker_project/shared/components/constants.dart';
import 'package:cv_mail_maker_project/test.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';


class NewCv extends StatefulWidget {
  const NewCv({Key? key}) : super(key: key);

  @override
  _NewCvState createState() => _NewCvState();
}

class _NewCvState extends State<NewCv> {
  List<String> names = [
    'Mohamed Fenina',
    'Fedi Fasaa',
    'Salma Mehrez',
    'Leith Kassous'


  ];
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      //Cvs.length == 0 ?Center(child: CircularProgressIndicator()):
        // ListView.separated(
        //     itemBuilder: (context, index)=>tests(Cvs[index]),
        //     separatorBuilder: (context,index)=>SizedBox(
        //       height: 20,
        //     ),
        //     itemCount: Cvs.length)
      // Column(
      //   children: [
      //     // tests(Cvs[Cvs.length-1]),
      //     // TextButton(onPressed: (){
      //     //   _creatPDF( PdfName: 't');
      //     // }, child: Text('ets')),
      //      CreateCv(),
      //
      //   ],
      // )




      ListView.separated(
          itemBuilder: (context, index)=>
              CV(model: Cvs[index],pressed: (){
                _creatPDF(
                    name: name(Cvs[index]),
                    profession:  profession(Cvs[index]),
                    email:  email(Cvs[index]),
                  phone:  phone(Cvs[index]),
                    date:  date(Cvs[index]),
                    nationality:  nationality(Cvs[index]),
                    address:  address(Cvs[index]),
                    skills:  skills(Cvs[index]),
                    language:  language(Cvs[index]),
                    orgname:  orgname(Cvs[index]),
                    designiation:  designiation(Cvs[index]),
                    joining:  joining(Cvs[index]),
                    end:  end(Cvs[index]),
                    achivement:  achivement(Cvs[index]),
                );
              }),


          separatorBuilder: (context,index)=>SizedBox(
            height: 20,
          ),
          itemCount: Cvs.length),



    );
  }
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
    final pdf = pw.Document();

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
