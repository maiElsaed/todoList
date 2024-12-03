import 'package:flutter/material.dart';

import '../constants/constant.dart';
class CustomTextField extends StatelessWidget {
  final hint;
  final maxLine;
  final Function(String?)? onsaved;
  final Function(String?)? onchange;
  const CustomTextField({super.key,required this.hint ,  this.maxLine=1, this.onsaved,this.onchange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if(value?.isEmpty ?? true){
          return "this field required";
        }
      },
      onChanged: onchange,
      onSaved:onsaved ,
      decoration: InputDecoration(
          border: OutLineInputBorder(),
          enabledBorder: OutLineInputBorder(),
          focusedBorder:OutLineInputBorder(),
          hintText: hint,
          hintStyle: TextStyle(color:kprimaryColor )
      ),
       maxLines:maxLine ,
    );
  }
  OutlineInputBorder OutLineInputBorder() {
    return  OutlineInputBorder(borderSide: BorderSide(color: kprimaryColor));
  }
}
