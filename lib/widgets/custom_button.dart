
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/cubits/add_cubits/add_cubit_state.dart';

import '../constants/constant.dart';
import '../cubits/add_cubits/add_cubit.dart';
import '../cubits/get_notes_cubits/gets_cubit.dart';
import 'custom_simple_dialoge.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback voidCallback;
  const CustomButton({super.key, required this.voidCallback});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AddCubit,AddCubitState>(
        listener: (context, state) {
          if (state is FailureState) {
            showAlertDialog(context: context, content: state.message);
          }
          if (state is SuccessState) {
            BlocProvider.of<GetsCubit>(context).getAllNotes();
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return GestureDetector(
            onTap: voidCallback,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                  color: kprimaryColor, borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: state is LoadingState
                      ? const CircularProgressIndicator()
                      : const Text(
                          "add",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
            ),
          );
        },

    );
  }
}
