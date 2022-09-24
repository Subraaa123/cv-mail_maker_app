import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

      obscureText: isPassword,
      validator: (String? value){
        return validate(value);
      },
      controller: contoller ,
      keyboardType: type,
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



      decoration:
      InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
        ),
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null ? IconButton(icon: Icon(suffix,),onPressed: (){
          suffixPressed!();
        },
        ) : null,

      ),
    );