import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/model/model.dart';

import '../constants/constant.dart';
import '../cubits/get_notes_cubits/gets_cubit.dart';
import 'custom_app_bar.dart';
import 'custom_sized_box.dart';
import 'custom_text_field.dart';

class CustomEditView extends StatefulWidget {
  NoteModel Note;
  int NoteKey;
   CustomEditView({required this.Note,required this.NoteKey});

  @override
  State<CustomEditView> createState() => _CustomEditViewState();
}

class _CustomEditViewState extends State<CustomEditView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, body;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             CustomAppBar(
              text: "Edit Note",
              icon: Icons.check,
              voidCallback: () {
                widget.Note.title=title??widget.Note.title;
                widget.Note.subtitle=body??widget.Note.subtitle;

                NoteBox.put(widget.NoteKey, widget.Note);
                BlocProvider.of<GetsCubit>(context).getAllNotes();
                Navigator.of(context).pop();
              },

            ),
            const CustomSizedBox(
              height: 10,
            ),
            CustomTextField(
              hint: widget.Note.title,
              maxLine: 1,
              onchange: (value) {
                title=value;
              },
            ),
            const CustomSizedBox(
              height: 15,
            ),
            CustomTextField(
              hint: widget.Note.subtitle,
              maxLine: 5,
              onchange: (value) {
                body=value;
              },
            ),
          ],
        ),
      ),
    );
  }
}
