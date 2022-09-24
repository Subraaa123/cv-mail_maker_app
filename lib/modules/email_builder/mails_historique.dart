import 'package:cv_mail_maker_project/pdf.dart';
import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:cv_mail_maker_project/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sqflite/sqflite.dart';

class MailsHistorique extends StatefulWidget {
  const MailsHistorique({Key? key}) : super(key: key);

  @override
  State<MailsHistorique> createState() => _MailsHistoriqueState();
}

class _MailsHistoriqueState extends State<MailsHistorique> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        PageView(
          children: [
            ListView.separated(
                itemBuilder: (context, index)=>
                    Mails(model: MailStage[index],
                        delete: (){
                      // delete(index, 'stage');

                        },
                        presse: (){
                          _creatPDF(
                              mail: demandeStage(
                                  EtudeOUEmploi:EtudeOuEmploi(MailStage[index]),
                                  dateDebut: dateDebut(MailStage[index]),
                                  duree: duree(MailStage[index])
                              ), PdfName:PdfName(MailStage[index]));

                        }),
                separatorBuilder: (context,index)=>SizedBox(
                  height: 20,
                ),
                itemCount: MailStage.length),

            ListView.separated(
                itemBuilder: (context, index)=>
                    Mails(model: MailFormation[index],
                        delete: (){

                        },
                        presse: (){
                          _creatPDF(
                              mail: demandeFormation(
                                  EtudeOUEmploi:EtudeOuEmploi(MailFormation[index]),
                                  DomaineFormation: DomaineFormation(MailFormation[index]),
                                  duree: duree(MailFormation[index]),
                                metier: metier(MailFormation[index]),
                                nomEtablissement: nomEtablissement(MailFormation[index]),
                                nomFormation: nomFormation(MailFormation[index]),
                              ), PdfName:PdfName(MailFormation[index]));

                        }),
                separatorBuilder: (context,index)=>SizedBox(
                  height: 20,
                ),
                itemCount: MailFormation.length),
          ],
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




    saveAndLaunchFile(pdf, '$PdfName');
  }

  // Future<int> delete(int index,String table,) async {
  //   var database = await openDatabase('MailData.db');
  //   return await database
  //       .rawDelete('DELETE FROM $table WHERE id = $index');
  // }
}
