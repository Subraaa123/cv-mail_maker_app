import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:flutter/material.dart';

class QualificationScreene extends StatelessWidget {
  const QualificationScreene({Key? key,
    required this.UniversityController,
    required this.DegreeController,
    required this.ScoreController,
    required this.EndQuaController,
  }) : super(key: key);
  final TextEditingController UniversityController;
  final TextEditingController DegreeController;
  final TextEditingController ScoreController;
  final TextEditingController EndQuaController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Qualification',
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
            contoller: UniversityController,
              type: TextInputType.text,
              validate: (){},
              hint: 'University or School Name',
              width: double.infinity),
          SizedBox(
            height: 20,
          ),
          optionTextFormField(
            contoller: DegreeController,
              type: TextInputType.text,
              validate: (){},
              hint: 'Degree title',
              width: double.infinity),
          SizedBox(
            height: 20,
          ),
          optionTextFormField(
            contoller: ScoreController,
              type: TextInputType.text,
              validate: (){},
              hint: 'Score',
              width: double.infinity),
          SizedBox(
            height: 20,
          ),
          optionTextFormField(
            contoller: EndQuaController,
              type: TextInputType.text,
              validate: (){},
              hint: 'End Date',
              width: double.infinity),
        ],
      ),
    );
  }
}
