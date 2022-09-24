import 'package:cv_mail_maker_project/shared/components/components.dart';
import 'package:flutter/material.dart';

class Achivements extends StatefulWidget {
  const Achivements({Key? key,
    required this.AchivementController
  }) : super(key: key);
  final TextEditingController AchivementController;

  @override
  State<Achivements> createState() => _AchivementsState();
}

class _AchivementsState extends State<Achivements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Achivement',
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
          optionTextFormField(contoller: widget.AchivementController,
              type: TextInputType.text,
              validate: (){},
              hint: 'Achivement',
              width: double.infinity),
        ],
      ),

    );
  }
}
