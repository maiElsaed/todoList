import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final text;
  final IconData icon;
  final VoidCallback? voidCallback;
  const CustomAppBar({required this.icon,required this.text,this.voidCallback});


  @override
  Widget build(BuildContext context) {
   final  width = MediaQuery.of(context).size.width;
   final  height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: width * .06),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xff675d66).withOpacity(.3),
          ),
          child: IconButton(
            onPressed:voidCallback,
            icon: Icon(icon),
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
