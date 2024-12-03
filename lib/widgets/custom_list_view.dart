import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:todolist/model/model.dart';
import '../constants/constant.dart';
import '../cubits/get_notes_cubits/gets_cubit.dart';
import 'custom_list_item.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List? keys;
 // @override
  // void initState() {
  //   //var NoteBox=Hive.box<NoteModel>(boxName);
  //    keys=NoteBox.keys.toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder< GetsCubit , GetsState >(
          builder: (context, state) {
            keys=NoteBox.keys.toList();
          List<NoteModel>AllNotes=  BlocProvider.of<GetsCubit>(context).allNotes??[];
            return ListView.builder(
              itemCount: AllNotes.length,
              itemBuilder: (context, index) {
                return CustomListItem(Note: AllNotes[index],NoteKey: keys![index],);
              },
            );
          },
        )
    );
  }
}
