import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

Color mainColor = Color(0xFF252c4a);






Widget FunctionButton({
  required String text,
  required String image,
  required Color color,
  required Function pressed,





})=>
Column(
children: [
ClipRRect(
borderRadius: BorderRadius.circular(10),
child: Container(
width: 80,
height: 90,
color: Colors.white,
child: MaterialButton(onPressed: (){
  pressed();
},


child: Image(
image:
AssetImage(
'assets/images/$image',
),
color: color,
fit: BoxFit.cover,

),
),
),
),
SizedBox(
height: 13,
),

Text(
text,
style: TextStyle(
color: Colors.white,
fontSize: 17,
fontWeight: FontWeight.w400

),
),
],
);

Widget defaultFormField({
  required TextEditingController contoller,
  required TextInputType type,
  Function? submited,
  Function? change,
  Function? tab,
  Function? suffixPressed,
  required Function validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  bool isPassword =false,

})=>
    TextFormField(
      controller: contoller ,
      keyboardType: type,

      validator: (String? value){
        return validate(value);
      },
      onFieldSubmitted: (String value)
      {
        submited!(value);
      },
      onChanged: (String value)
      {
        change!(value);
      },
      onTap: ()
      {
        tab!();
      },

      style: TextStyle(fontSize: 22.0, color: Colors.black),

      cursorColor: Color(0xFF252c4a) ,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.grey[200],
        filled: true,
        labelStyle:  TextStyle(
            fontSize: 20,
          color: Color(0xFF252c4a),
          fontWeight: FontWeight.w500
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Color(0xFF252c4a),
            width: 3
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 2.0,
          ),
        ),




        prefixIcon: prefix != null ? Icon(prefix,
        color:Color(0xFF252c4a) ,
        ) : null,
        suffixIcon: suffix != null ? IconButton(icon: Icon(suffix,),onPressed: (){
          suffixPressed!();
        },
        ) : null,

      ),
    );

Widget optionTextFormField({
   TextEditingController? contoller,
  required TextInputType type,
  Function? submited,
  Function? change,
  Function? tab,
  Function? suffixPressed,
  required Function validate,
  required String hint,
  IconData? prefix,
  IconData? suffix,
  bool isPassword =false,
  required double width

})=>
    Container(
      width: width,
      child: TextFormField(
        controller: contoller ,
        keyboardType: type,

        validator: (String? value){
          return validate(value);
        },
        onFieldSubmitted: (String value)
        {
          submited!(value);
        },
        onChanged: (String value)
        {
          change!(value);
        },
        onTap: ()
        {
          tab!();
        },

        style: TextStyle(fontSize: 22.0, color: Colors.black),

        cursorColor: Color(0xFF252c4a) ,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:  TextStyle(
              fontSize: 20,
              color:Colors.grey,
              fontWeight: FontWeight.w500
          ),

          fillColor: Colors.grey[200],
          filled: true,


          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
                color: Color(0xFF252c4a),
                width: 3
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2.0,
            ),
          ),




          prefixIcon: prefix != null ? Icon(prefix,
            color:Color(0xFF252c4a) ,
          ) : null,
          suffixIcon: suffix != null ? IconButton(icon: Icon(suffix,),onPressed: (){
            suffixPressed!();
          },
          ) : null,

        ),
      ),
    );
Widget NBbutton({
   int? pageIndex,
  required Function pressed,
  required String text,
  IconData? iconFirst,
  IconData? iconSecond,


})=>
Visibility(
visible:  pageIndex==0?false:true,
child: Container(
decoration: BoxDecoration(

borderRadius: BorderRadius.circular(5),
color: Color(0xFF252c4a),
),

child: MaterialButton(onPressed: (){
pressed();
}, child:
Row(
children: [
Icon(iconFirst,
color: Colors.white,),
Visibility(
  visible: iconFirst==null?false:true,
  child:   SizedBox(

  width: 20,

  ),
),
Text(text,
style: TextStyle(
color: Colors.white
),),
  Visibility(
    visible: iconSecond==null?false:true,
    child: SizedBox(
      width: 20,
    ),
  ),
  Icon(iconSecond,
    color: Colors.white,),
],
),
),
),
);

Widget SButton({
  required String text,
  required Function pressed,


})=>
Column(
  children: [
        Container(
    width: 110,
    decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(15),
    color: Color(0xFF252c4a),
    ),
    child: MaterialButton(onPressed: (){

      pressed();
    },


    child: Text(text,

    style: TextStyle(

    color: Colors.white,
    fontSize: 13,
    ),),),
    ),

  ],
);

Widget test123(
Map model
)=>
    Column(
      children: [
        Text('${model['name']}'),
      ],
    );

String demandeFormation({

  required String EtudeOUEmploi,
  required String DomaineFormation,
  required String nomFormation,
  required String nomEtablissement,
  required String metier,
  required String duree,




})=>
'Madame, Monsieur,'

'Actuellement $EtudeOUEmploi, j\'ai toujours eu un intérêt certain pour le domaine '
    'de $DomaineFormation Je souhaiterais aujourd\'hui intégrer votre formation '
    '$nomFormation au sein de l\'établissement $nomEtablissement,'
    ' et me permets de vous transmettre mon dossier de candidature.\n\n'

'Passionné de $DomaineFormation, je souhaite acquérir les compétences techniques essentielles'
    ' au métier de $metier. Votre formation semble en ce point correspondre tout à '
    'fait à mes attentes. Le contenu des cours et l\'ensemble des connaissances associées me '
    'permettraient d\'atteindre mes objectifs professionnels en $duree, un atout '
    'non négligeable à mes yeux !\n\n'

    'Rigoureux et investi, j\'ai su faire preuve d\'organisation et de détermination dans mon '
    'travail scolaire jusqu\'à présent. Je souhaite continuer sur cette voie au sein de votre formation,'
    ' afin d\'acquérir toutes les connaissances nécessaires au métier de $metier.\n\n'

    'Dans l\'attente d\'une réponse qui je l\'espère sera positive, veuillez agréer, Madame, Monsieur,'
    ' l\'expression de mes salutations distinguées.\n\n';
String demandeStage({
  required String EtudeOUEmploi,
  required String duree,
  required String dateDebut,

}

    )=>
'(Madame, Monsieur),\n\n'


'Actuellement en cours d\'études de $EtudeOUEmploi, je suis à la recherche '
'd\'une entreprise qui pourrait m\'accueillir dans le cadre d\'un stage conventionné d\'une durée de $duree '
'à compter du $dateDebut.\n\n'

'C\'est donc tout naturellement que je me suis tourné vers votre entreprise dont le secteur d\'activités correspond parfaitement '
'à mes aspirations professionnelles futures. Je serai honoré de pouvoir parfaire mes connaissances en intégrant votre équipe en tant que stagiaire.\n\n'

'Rigoureux et polyvalent, je serai ravi de pouvoir apporter mes compétences acquises au cours de mon cursus ainsi que mon profond'
' enthousiasme à travailler à vos côtés.\n\n'

'Je vous remercie vivement de l\'attention que vous porterez à cette demande de stage. Je me tiens à votre disposition pour un entretien.\n\n'

'Dans l\'attente de votre réponse, je vous prie d\'agréer, Madame, Monsieur, l\'expression de mon plus profond respect.\n\n';

Widget Mails(
{
  required Map model,
  required Function presse,
  required Function delete,
}


)=>



Container(
  width: double.infinity,
  height: 60,
  color: Colors.grey[200],
  child:   MaterialButton(onPressed: (){

    presse();



  },

    color: Colors.grey[200],

  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [

          Row(
            children: [
              Text('Pdf Title  :  ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19
                ),),

              Text('${model['pdfName']}',
              style: TextStyle(
                color:mainColor ,
                fontSize: 19
              ),),
            ],
          ),
          Row(
            children: [
              Text('Mail Form  :  ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17
                ),),

              Text('${model['mailForm']}',
                style: TextStyle(
                    color:mainColor ,
                    fontSize: 17
                ),),
            ],
          ),









        ]

      ),
      SizedBox(
        width: 3,
      ),
      IconButton(onPressed: (){
        delete();

      }, icon: Icon(Icons.delete_forever,
      color: Colors.red,
      size: 25,)),
    ],
  ),

  ),
);



Widget CreateCv()=>
Row(
  mainAxisAlignment: MainAxisAlignment.start,
      children: [
    Container(
      color:Colors.grey[200],
      width: 180,
      height:500,

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
  children: [
    Text('name'),
    Text('prtoffesion'),
    Text('objectives'),

    Container(
      color: Colors.black,
width: 100,
      height: 1,
    ),
    Text('contact detail'),
    Container(
      color: Colors.white,
      width: 100,
      height: 1,
    ),
    Row(
      children: [
        Text('✉',style: TextStyle(color: Colors.white,
        fontSize: 25),),
        SizedBox(width: 10,),
        Text('@maill'),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Row(
      children: [
        Text('📞'),
        SizedBox(width: 10,),
        Text('94126854'),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Row(
      children: [
        Text('📍'),
        SizedBox(width: 10,),
        Text('@maill'),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Row(
      children: [
        Text('🚩'),
        SizedBox(width: 10,),
        Text('@maill'),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Row(
      children: [
        Text('📅',style: TextStyle(color: Colors.black),),
        SizedBox(width: 10,),
        Text('@maill'),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Row(
      children: [
        Text('🚩'),
        SizedBox(width: 10,),
        Text('@maill'),
      ],
    ),
    SizedBox(
      height: 10,
    ),
    Text('Languages'),
    Container(
      color: Colors.white,
      width: 100,
      height: 1,
    ),
    Row(
      children: [
        Text('sqkfkljljkhsfdyqfhsikfj,hsdoqoirjfsqoifhjsiqjfr'.replaceAll(',',' \n')),
      ],
    ),
    Text('Skills'),
    Container(
      color: Colors.white,
      width: 100,
      height: 1,
    ),
    Row(
      children: [
        Text('sqkfkljljk'.replaceAll(',',' \n')),
      ],
    ),













  ],



),
      ),
    ),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SizedBox(height: 40,),
            Container(
              padding: EdgeInsets.only(
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0, // Underline thickness
                  ))
              ),
              child: Text(
                "Work Experience",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0, // Underline thickness
                  ))
              ),
              child: Text(
                "Qualification",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                bottom: 5, // Space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: Colors.black,
                    width: 1.0, // Underline thickness
                  ))
              ),
              child: Text(
                "Achivements & Awards",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            )
          ],
        )
      ],
    );




String EtudeOuEmploi(
Map model
)=>
    '${model['pdfName']}';
String DomaineFormation(
    Map model
    )=>
    '${model['pdfName']}';
String nomFormation(
    Map model
    )=>
    '${model['pdfName']}';
String nomEtablissement(
    Map model
    )=>
    '${model['pdfName']}';
String metier(
    Map model
    )=>
    '${model['pdfName']}';
String duree(
    Map model
    )=>
    '${model['pdfName']}';
String PdfName(
    Map model
    )=>
    '${model['pdfName']}';
String dateDebut(
    Map model
    )=>
    '${model['startDate']}';




String name(
    Map model
    )=>
    '${model['name']}';
String profession(
    Map model
    )=>
    '${model['profession']}';
String email(
    Map model
    )=>
    '${model['email']}';
String phone(
    Map model
    )=>
    '${model['phone']}';
String date(
    Map model
    )=>
    '${model['date']}';
String nationality(
    Map model
    )=>
    '${model['nationality']}';
String address(
    Map model
    )=>
    '${model['address']}';
String skills(
    Map model
    )=>
    '${model['skills']}';
String language(
    Map model
    )=>
    '${model['language']}';
String orgname(
    Map model
    )=>
    '${model['orgname']}';
String designiation(
    Map model
    )=>
    '${model['designiation']}';
String joining(
    Map model
    )=>
    '${model['joining']}';
String end(
    Map model
    )=>
    '${model['end']}';
String achivement(
    Map model
    )=>
    '${model['achivement']}';








Widget CV(
    {


      required Map model,
      required Function pressed
    }


    )=>



    Container(
      width: double.infinity,
      height: 60,
      color: Colors.grey[200],
      child:   MaterialButton(onPressed: (){

      pressed();
      },

        color: Colors.grey[200],

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Row(
                    children: [
                      Text('Full Name  :  ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20
                        ),),

                      Text('${model['name']}',
                        style: TextStyle(
                            color:mainColor ,
                            fontSize: 20
                        ),),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Date Birth  :  ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17
                        ),),

                      Text('${model['date']}',
                        style: TextStyle(
                            color:mainColor ,
                            fontSize: 17
                        ),),
                    ],
                  ),









                ]

            ),
            SizedBox(
              width: 20,
            ),
            IconButton(onPressed: (){


            }, icon: Icon(Icons.delete_forever,
              color: Colors.red,
              size: 30,)),
          ],
        ),

      ),
    );



