import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.ontap,required this.name,required this.color}) ;
  VoidCallback? ontap;
  Color color ;

  String ?name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 200,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Color(0xFF1565C0),
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),

        child: Center(child: Text('$name',style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}