import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/cubits/add_cubits/add_cubit_state.dart';
import 'package:todolist/model/model.dart';

import '../cubits/add_cubits/add_cubit.dart';
import '../cubits/get_notes_cubits/gets_cubit.dart';
import 'custom_button.dart';
import 'custom_sized_box.dart';
import 'custom_text_field.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({super.key});
  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, body;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCubit, AddCubitState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is LoadingState ? true : false,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  CustomTextField(
                    hint: "title",
                    maxLine: 1,
                    onsaved: (value) {
                      title = value;
                    },
                  ),
                  const CustomSizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    hint: "body",
                    maxLine: 5,
                    onsaved: (value) {
                      body = value;
                    },
                  ),
                  const CustomSizedBox(
                    height: 55,
                  ),
                  CustomButton(
                    voidCallback: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var addCubit = await BlocProvider.of<AddCubit>(context)
                            .addNote(NoteModel(
                                title: title!,
                                subtitle: body!,
                                date: DateTime.now().toString(),
                                color: Colors.red.value));
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                      // Navigator.of(context).pushNamed(EditView().id);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
