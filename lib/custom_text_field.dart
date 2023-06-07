import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText,required this.title,required this.icon,this.onChanged});
  String hintText;
  String title;
  Icon icon;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (data){
        if(data!.isEmpty){
          return "Must not be Embty";

        }
        return null;
      },

      decoration: InputDecoration(


        fillColor: Colors.white,
        filled: true,
        labelText: title,
        hintText: hintText,
        prefixIcon: icon,
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onChanged: onChanged,

    );
  }
}
