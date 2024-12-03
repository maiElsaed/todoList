import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:todolist/model/model.dart';

import '../constants/constant.dart';
import '../cubits/get_notes_cubits/gets_cubit.dart';
import '../views/edit_view.dart';
import 'custom_sized_box.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({required this.Note, required this.NoteKey});

  final NoteModel Note;
  final int NoteKey;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * .01),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, EditView().id,arguments: {'Note':Note,'NoteKey':NoteKey});
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffd5934f), borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Padding(
                  padding:
                      EdgeInsets.only(top: height * .03, bottom: height * .03),
                  child: Text(
                    "${Note.title}",
                    style: TextStyle(fontSize: width * .06),
                  ),
                ),
                subtitle: Text(
                  "${Note.subtitle}",
                  style: TextStyle(fontSize: width * .04),
                ),
                trailing: Padding(
                  padding: EdgeInsets.only(right: width * .0),
                  child: IconButton(
                      onPressed: () {
                        NoteBox.delete(NoteKey);
                         BlocProvider.of<GetsCubit>(context).getAllNotes();
                      },
                      icon:
                          Icon(FontAwesomeIcons.trash, color: Colors.black87)),
                  //FontAwesomeIcons.trash,color: Colors.black87
                ),
              ),
              CustomSizedBox(
                height: height * .03,
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: width * .04, bottom: height * .03),
                child: Text(
                  "May 21-2024",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
