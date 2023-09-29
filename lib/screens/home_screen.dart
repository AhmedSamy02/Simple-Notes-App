import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/get_notes/get_notes_cubit.dart';
import 'package:notes_app/views/add_note_bottom_sheet.dart';
import 'package:notes_app/views/custom_app_bar.dart';
import 'package:notes_app/views/custom_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50.0),
              ),
            ),
            context: context,
            builder: (context) {
              return Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddNoteBottomSheet());
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: CustomAppBar(
        text: 'Notes',
        iconName: Icons.search,
        onTap: (){},
      ).build(context),
      body:const SizedBox(
        width: double.infinity,
        height: double.infinity,
        child:  CustomListTile(),
      ),
    );
  }
}
