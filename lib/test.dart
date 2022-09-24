import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;

import 'pdf.dart';
class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Center(child: Column(
        children: [
          // ElevatedButton(
          //   child: Text('creat PDF'),
          //   onPressed:
          // ),
          Image(

            image:

            AssetImage(

              'assets/images/swift.png',

            ),

            height: 200,

            width: double.infinity,

            fit: BoxFit.cover,

          ),
          TextButton(onPressed: (){
            pickImage();
          }, child: Text('add photo')),
          TextButton(onPressed: (){}, child: Text('take photo'))
        ],
      ),
      ),
    );
  }


  Future<Uint8List> _readImageData(String name) async{
    final data = await rootBundle.load('assets/images/$name');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);


  }
  Future pickImage() async{
    ImagePicker _picker = new ImagePicker();
    PickedFile? file = (await _picker.pickImage(source: ImageSource.gallery)) as PickedFile?;
    Uint8List? bytes = await file?.readAsBytes();

  }


}
