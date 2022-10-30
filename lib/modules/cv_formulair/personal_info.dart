import 'package:cv_mail_maker_project/layout/cv_maker.dart';
import 'package:cv_mail_maker_project/shared/components/components.dart';

import 'package:flutter/material.dart';

class PersonalInfoScreene extends StatefulWidget {
  const PersonalInfoScreene({
    Key? key,required this.fullNameController,
    required this.ProfessionController,
    required this.EmailController,
    required this.DateController,
    required this.NationalityController,
    required this.AddressController,
    required this.NumberContoller,



  }) : super(key: key);
  final TextEditingController fullNameController;
  final TextEditingController EmailController;
  final TextEditingController ProfessionController;

  final TextEditingController NumberContoller;

  final TextEditingController DateController;
  final TextEditingController NationalityController;
  final TextEditingController AddressController;





  @override
  _PersonalInfoScreeneState createState() => _PersonalInfoScreeneState();
}


class _PersonalInfoScreeneState extends State<PersonalInfoScreene> {
var genderIndex=0;
var statusIndex=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20),
            defaultFormField(
              contoller: widget.fullNameController,
                type: TextInputType.text,
                validate: (){},
              label: 'Full Name',
              prefix: Icons.person
            ),
            SizedBox(height: 20),

            defaultFormField(
              contoller: widget.ProfessionController,
              type: TextInputType.text,
              validate: (){},
              label: 'Profession',
              prefix: Icons.work
            ),
            // SizedBox(height: 20),
            // Container(
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.grey,
            //     width: 2),
            //   borderRadius: BorderRadius.circular(10),
            //
            //   color: Colors.grey[200],
            //   ),
            //   height: 65,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.horizontal(right: Radius.zero,
            //           left: Radius.circular(10)),
            //           color: genderIndex==0?Colors.grey:Colors.grey[200],
            //         ),
            //         width: 110,
            //
            //         child: MaterialButton(onPressed: (){
            //           setState(() {
            //             genderIndex=0;
            //           });
            //         },
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Icon(Icons.male,
            //               color: Color(0xFF252c4a),),
            //             Text('Male',
            //               style: TextStyle(
            //                   color: Color(0xFF252c4a)
            //               ),),
            //           ],
            //         ),
            //         ),
            //       ),
            //       Spacer(),
            //
            //       Container(
            //         width: 100,
            //         color: genderIndex==1?Colors.grey:Colors.grey[200],
            //         child: MaterialButton(onPressed: (){
            //           setState(() {
            //             genderIndex=1;
            //           });
            //         },
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Icon(Icons.female,
            //                 color: Colors.black,),
            //               Text('Female',
            //                 style: TextStyle(
            //                     color: Colors.black
            //                 ),),
            //             ],
            //           ),
            //         ),
            //       ),
            //       Spacer(),
            //
            //       Container(
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.horizontal(left: Radius.zero,
            //               right: Radius.circular(10)),
            //           color: genderIndex==2?Colors.grey:Colors.grey[200],
            //         ),
            //         width: 110,
            //         child: MaterialButton(onPressed: (){
            //           setState(() {
            //             genderIndex=2;
            //           });
            //         },
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               Icon(Icons.transgender,
            //               color: Colors.black,),
            //               Text('Other',
            //               style: TextStyle(
            //                 color: Colors.black
            //               ),),
            //             ],
            //           ),
            //         ),
            //       ),
            //
            //
            //     ],
            //   ),
            // ),




            SizedBox(height: 20),
            defaultFormField(
              contoller: widget.EmailController,
              type: TextInputType.text,
              validate: (){},
              label: 'Email ID',
              prefix: Icons.mail
            ),
            SizedBox(height: 20),
            defaultFormField(contoller: widget.NumberContoller,
                type: TextInputType.number,
                validate:  (){},
                label: 'Phone Number',
              prefix: Icons.phone
            ),


            SizedBox(height: 20),
            defaultFormField(
              contoller: widget.DateController,
              type: TextInputType.text,
              validate: (){},
              label: 'Date of Birth',
              prefix: Icons.date_range
            ),

            SizedBox(height: 20),
            defaultFormField(
              contoller: widget.NationalityController,
              type: TextInputType.text,
              validate: (){},
              label: 'Nationality',
              prefix: Icons.assistant_photo
            ),
            SizedBox(height: 20),
            defaultFormField(
              contoller: widget.AddressController,
              type: TextInputType.text,
              validate: (){},
              label: 'Address',
              prefix: Icons.location_on
            ),
            SizedBox(height: 20),







          ],
        ),
      ),
    );
  }

}
