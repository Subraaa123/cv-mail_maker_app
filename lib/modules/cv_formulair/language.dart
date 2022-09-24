import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:flutter/material.dart';

class LanguageScreene extends StatefulWidget {


  const LanguageScreene({
    Key? key,required this.LanguageController}) : super(key: key);
  final TextEditingController LanguageController;

  @override
  State<LanguageScreene> createState() => _LanguageScreeneState();
}

class _LanguageScreeneState extends State<LanguageScreene> {
  var languageController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Language',
            textAlign:TextAlign.start,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
          ),
          SizedBox(
            height: 20,
          ),
          optionTextFormField(contoller: widget.LanguageController,
              type: TextInputType.text,
              validate: (){},
              hint: 'Write language e.g English,Arabic',
              width: double.infinity),
        ],
      ),
    );
  }
}
