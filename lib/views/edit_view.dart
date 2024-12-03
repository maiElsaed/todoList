import 'package:flutter/material.dart';
import 'package:todolist/model/model.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_edit_view.dart';
class EditView extends StatelessWidget {
  final id="EditView";
  const EditView({super.key});

  @override
  Widget build(BuildContext context) {
   final NoteData = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;

   print("//////////////////");
   print("${NoteData?['Note']} ${NoteData!['NoteKey']}  ");
    return Scaffold(
      body:Padding(padding: EdgeInsets.all(16),
       //'Note':Note,'NoteKey':NoteKey

       child: CustomEditView( Note:NoteData['Note'] ,NoteKey:NoteData['NoteKey'] ),
      ) ,
    );
  }
}
