
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/constant.dart';
import '../../model/model.dart';
import 'add_cubit_state.dart';

class AddCubit extends Cubit<AddCubitState>{
  AddCubit():super(initialState());
  addNote(NoteModel noteModel)async{
    emit(LoadingState());
    try{
      var NoteBox=Hive.box<NoteModel>(boxName);
     await NoteBox.add(noteModel);
      emit(SuccessState());
    }catch(e){
      emit(FailureState(message: e.toString()));
    }
  }
}