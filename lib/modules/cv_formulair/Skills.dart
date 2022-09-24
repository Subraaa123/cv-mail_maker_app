import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:flutter/material.dart';

class SkillsScreene extends StatefulWidget {
  const SkillsScreene({
    Key? key,required this.SkillsController,
  }) : super(key: key);
  final TextEditingController SkillsController;

  @override
  _SkillsScreeneState createState() => _SkillsScreeneState();
}

class _SkillsScreeneState extends State<SkillsScreene> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('All Skills',
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
         optionTextFormField(contoller: widget.SkillsController,
             type: TextInputType.text,
             validate: (){},
             hint: 'Enter Skills e.g Flutter,Java',
         width: double.infinity),
        ],
      ),
      
    );
  }
}
