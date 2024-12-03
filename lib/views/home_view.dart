import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_home_view.dart';

class HomeView extends StatelessWidget {
 const HomeView({super.key});
  final String id = "HomeView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          backgroundColor: kprimaryColor,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                //Colors.black;
                return Padding(
                  padding: const EdgeInsets.only(top: 25,left:20 ,right:20,bottom: 25 ),
                  child: CustomBottomSheet(),
                );
              },
            );
          },
          child: Icon(Icons.add,color: Colors.black,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: CustomHomeView(),
      ),
    );

    //ListItem();
  }
}
