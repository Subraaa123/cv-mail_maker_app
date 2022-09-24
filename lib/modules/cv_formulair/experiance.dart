import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:flutter/material.dart';

class ExpirienceScreene extends StatefulWidget {
  const ExpirienceScreene({Key? key,
  required this.OrgNameController,
    required this.DesigniationController,
    required this.JoiningController,
    required this.EndController,
  }) : super(key: key);
  final TextEditingController OrgNameController;
  final TextEditingController DesigniationController;
  final TextEditingController JoiningController;
  final TextEditingController EndController;
  @override
  State<ExpirienceScreene> createState() => _ExpirienceScreeneState();
}

class _ExpirienceScreeneState extends State<ExpirienceScreene> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Experience',
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
          optionTextFormField(
            contoller: widget.OrgNameController,
              type: TextInputType.text,
              validate: (){},
              hint: 'Organisation Name',
              width: double.infinity),
          SizedBox(
            height: 20,
          ),
          optionTextFormField(
            contoller: widget.DesigniationController,

              type: TextInputType.text,
              validate: (){},
              hint: 'Designiation',
              width: double.infinity),
          SizedBox(
            height: 20,
          ),
          optionTextFormField(
            contoller:widget.JoiningController ,
              type: TextInputType.text,
              validate: (){},
              hint: 'Joining Date',
              width: double.infinity),
          SizedBox(
            height: 20,
          ),
          optionTextFormField(
            contoller: widget.EndController,
              type: TextInputType.text,
              validate: (){},
              hint: 'End Date',
              width: double.infinity),
        ],
      ),

    );
  }
}
