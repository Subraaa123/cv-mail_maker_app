
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http ;
class GitRepository extends StatefulWidget {

  String login="" ;
  GitRepository(this.login);


  @override
  State<GitRepository> createState() => _GitRepositoryState();
}

class _GitRepositoryState extends State<GitRepository> {
  dynamic dataRepo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRepositories();
  }
  void loadRepositories() async{

    var url=Uri.parse("https://api.github.com/users/${widget.login}/repos");
    http.Response response = await http.get(url);
    if(response.statusCode==200){
      setState(() {
        dataRepo=json.decode(response.body);
        print(dataRepo);
      });

    }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar:AppBar(title: Text('REPO OF ${widget.login}'),) ,
      body: Center(
          child : ListView.separated(
              itemBuilder: (context,index)=> ListTile(
                title : Text("${dataRepo[index]['name']}"),
              ),
              separatorBuilder: (context,index)=>Divider(height: 10,color:Colors.blue),
              itemCount: dataRepo==null?0:dataRepo.length)
      ),

    );
  }
}