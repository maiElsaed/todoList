import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../cubits/add_cubits/add_cubit.dart';
import '../cubits/add_cubits/add_cubit_state.dart';
import '../views/edit_view.dart';
import 'custom_button.dart';
import 'custom_form.dart';
import 'custom_simple_dialoge.dart';
import 'custom_sized_box.dart';
import 'custom_text_field.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCubit(),
      child: Padding(
        padding:  EdgeInsets.only(
          bottom:MediaQuery.of(context).viewInsets.bottom
        ),
        child: CustomFormField(),
      ),
    );
  }
}