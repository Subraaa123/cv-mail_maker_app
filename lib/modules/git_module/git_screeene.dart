

import 'package:cv_mail_maker_project/modules/git_module/git_repository.dart';
import 'package:flutter/material.dart';





import 'dart:convert';


import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class ProjectGithub extends StatefulWidget {
  @override
  State<ProjectGithub> createState() => _ProjectGithubState();
}

class _ProjectGithubState extends State<ProjectGithub> {
  String querry="" ;
  bool NotVissible = false;
  dynamic data ;
  int curruntPage=0;
  int totalePage=0 ;
  int pageSize=10;
  ScrollController scroll = new ScrollController();
  void _searsh(String querry) {
    var url=Uri.parse("https://api.github.com/search/users?q=${this.querry}&per_page=${pageSize}&page=${curruntPage}");
    http.get(url).then((value) {this.data=json.decode(value.body);
    this.totalePage=this.data["total_count"];
    print(data);
    if(data["total_count"]% pageSize == 0){
      this.totalePage= (this.data["total_count"]/pageSize);
    }else{
      this.totalePage= (this.data["total_count"]/pageSize).floor + 1;
    }
    }

    ).catchError((err){
      print(err);
    });



  }

  TextEditingController queryTextControler = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.scroll.addListener(() {
      if(this.scroll.position.pixels==this.scroll.position.maxScrollExtent)
        setState(() {
          this.curruntPage=this.curruntPage+1;
          _searsh(querry);
        });


    });
  }
  @override
  Widget build(BuildContext context) {
    print("bilding");
    return Scaffold(
      appBar: AppBar(
          title:Text("  ${querry} => ${curruntPage} / ${totalePage}")),

      body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child:
                  Container(
                      padding:EdgeInsets.all(5) ,
                      child:TextFormField(

                        obscureText: NotVissible,
                        onChanged:(value) {
                          print(value);

                        },
                        controller: queryTextControler,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                NotVissible=!NotVissible ;
                              });

                            },icon : Icon(NotVissible==true?Icons.visibility_off:Icons.visibility,color: Colors.black,)),
                            focusColor: Colors.deepOrange,

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 5,
                                    color:Colors.blue

                                )
                            )
                        ),
                      )
                  )
                  ),IconButton(onPressed: (){
                    this.querry = queryTextControler.text;
                    setState(() {
                      print(querry);
                      _searsh(querry);
                    });
                  }, icon: Icon(Icons.search,color:Colors.blue))
                ],

              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context,index)=>Divider(height : 10,color:Colors.blueAccent),
                  controller: scroll,
                  itemCount: (data==null)?0:(data['items'].length),
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context)=>GitRepository(data['items'][index]['login'])  ));
                      },

                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(data['items'][index]['avatar_url']),
                                radius:30,
                              ),SizedBox(width: 30,)
                              ,Text(data['items'][index]["login"])
                            ],
                          ),
                          CircleAvatar(
                            child:Text("${data['items'][index]['score']}"),
                            radius:15,
                          )

                        ],
                      ),
                    );

                  },
                ),
              )

            ],
          )
      ),
    );
  }



}
