import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:pdf/widgets.dart';

Future<void> saveAndLaunchFile(Document pdf,
String PdfName)async{
  final output = await getTemporaryDirectory();
  final file = File('${output.path}/$PdfName');
  await file.writeAsBytes(await pdf.save());
  OpenFile.open('${output.path}/$PdfName');
}



