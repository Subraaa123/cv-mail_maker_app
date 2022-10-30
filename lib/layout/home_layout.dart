

import 'package:cv_mail_maker_project/modules/email_builder/mails_historique.dart';
import 'package:cv_mail_maker_project/modules/basic_screens/home_screene.dart';
import 'package:cv_mail_maker_project/modules/basic_screens/saved_screene.dart';
import 'package:cv_mail_maker_project/modules/git_module/git_screeene.dart';
import 'package:cv_mail_maker_project/modules/cv_formulair/new_cv.dart';
import 'package:cv_mail_maker_project/shared/components/constants.dart';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatefulWidget {




  const HomeLayout({Key? key,}) : super(key: key);

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  Color mainColor = Color(0xFF252c4a);
  Color secondColor = Color(0xFF117eeb);
  Color btnColor = Color(0xFF117eeb);


  int currentIndex =0;

  List<Widget> screens =[
    HomeScreene(),
    SavedScreene(),



  ];
  List<String> titles = [
    'Home',
    'Saved',


  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_outlined,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        title: Text(titles[currentIndex],
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        backgroundColor: mainColor,
        elevation: 0,





      ),
      drawer:SafeArea(

        child: Drawer(

          child: Container(
            color: Colors.grey[200],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFF252c4a),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xff1E3D45FF),
                            child: Icon(Icons.supervised_user_circle,
                              size: 60,)
                        ),
                        SizedBox(height: 5,),
                        Text('CV & Mail Maker ',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(height: 5,),


                      ],
                    ),
                  ),
                ),
                Container(

                  color: Colors.grey[200],
                  child: Column(
                    children: [
                      MaterialButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProjectGithub(),),);

                      },
                        child: Row(
                          children: [
                            SizedBox(width: 15,),
                            Image(image: AssetImage('assets/images/git.jpg',),
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(width: 25,),
                            Text('GIT',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 2,
                        color: Colors.grey[400],
                        width: double.infinity,
                      ),




                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) async{
          setState(() {
            currentIndex = index;
          });

        },
        items: [
          BottomNavigationBarItem(icon:
          Icon(Icons.home,
          ),
            label: titles[0],

          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.archive,

          ),
            label: titles[1],
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedFontSize: 15,
        selectedIconTheme: IconThemeData(size: 30),

        selectedItemColor: Color(0xFF252c4a),
      ),
      //
    );
  }

}
