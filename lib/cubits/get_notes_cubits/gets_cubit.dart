import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:todolist/model/model.dart';
import '../../constants/constant.dart';

part 'gets_state.dart';

class GetsCubit extends Cubit<GetsState> {
  List<NoteModel>?allNotes;
  GetsCubit() : super(GetsInitial());
  getAllNotes(){
    var noteBox=Hive.box<NoteModel>(boxName);
    allNotes=noteBox.values.toList();
   // noteBox.delete();
    emit(SuccesState());
  }
}
