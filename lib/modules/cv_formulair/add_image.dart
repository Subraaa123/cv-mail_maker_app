import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';

class AddImage extends StatefulWidget {
  const AddImage({Key? key}) : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? image;
  Future _imgFromGallery() async {
    final pickedImage =
    await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedImage != null) {
        this.image  = new File(pickedImage.path);
      }
    });
  }

  // Future pickImage() async{
  //
  //
  //
  //
  //   // if (pickedFile.path != null) {
  //   //   File pickedVideo = File(pickedFile.path);
  //   // }
  //
  //
  //   ImagePicker picker  = ImagePicker();
  //   try {
  //     final pickedFile = await picker.pickVideo(source: ImageSource.gallery,);
  //     if (pickedFile == null)
  //       return;
  //     final pickedVideo = File(pickedFile.path);
  //     setState(() {
  //       this.image = pickedVideo;
  //     });
  //   }on PlatformException catch(error){
  //     print('failed to pick image $error');
  //   }
  //
  //
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

      Center(
        child: TextButton(
          child: Text('test'),
          onPressed: (){
            _imgFromGallery();
          },

        ),
      ),

    );
  }
}
