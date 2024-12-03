import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist/views/edit_view.dart';
import 'package:todolist/views/home_view.dart';
import 'constants/constant.dart';
import 'cubits/add_cubits/add_cubit.dart';
import 'cubits/get_notes_cubits/gets_cubit.dart';
import 'model/model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetsCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          initialRoute: HomeView().id,
          routes: {
            HomeView().id: (context) => HomeView(),
            EditView().id: (context) => EditView(),
          }),
    );
  }
}
