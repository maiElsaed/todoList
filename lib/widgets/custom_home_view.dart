import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_notes_cubits/gets_cubit.dart';
import 'custom_app_bar.dart';
import 'custom_list_item.dart';
import 'custom_list_view.dart';
import 'custom_sized_box.dart';

class CustomHomeView extends StatefulWidget {
  const CustomHomeView({super.key});

  @override
  State<CustomHomeView> createState() => _CustomHomeViewState();
}

class _CustomHomeViewState extends State<CustomHomeView> {
  @override
  void initState() {
    BlocProvider.of<GetsCubit>(context).getAllNotes();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [

          const CustomAppBar(text: "Notes",icon: Icons.search),
          const CustomSizedBox(
            height: 10,
          ),
          const CustomListView(),

        ],
      ),
    );
  }
}
