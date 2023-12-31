import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubit/edit_note/editnote_cubit.dart';
import 'package:notes_app/cubit/get_notes/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/custom_app_bar.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key, this.note});
  NoteModel? note;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = widget.note;
    screenPickerColor = Color(data!.color);
    titleController.text = data!.title;
    contentController.text = data!.content;
  }

  NoteModel? data;
  Color screenPickerColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Edit Note',
        iconName: Icons.check,
        onTap: () async {
          await BlocProvider.of<EditnoteCubit>(context).editNote(
            data!.key,
            NoteModel(
              title: titleController.text,
              content: contentController.text,
              date: DateFormat.yMd().add_jm().format(DateTime.now()),
              color: screenPickerColor.withOpacity(221 / 256).value,
            ),
          );
        },
      ).build(context),
      body: BlocConsumer<EditnoteCubit, EditnoteState>(
        listener: (context, state) {
          if (state is EditnoteFailure) {
            Fluttertoast.showToast(
              msg: state.message,
              fontSize: 18,
              textColor: Colors.white,
            );
          } else if (state is EditnoteSuccess) {
            Fluttertoast.showToast(
              msg: 'Edited Successfully',
              fontSize: 18,
              textColor: Colors.white,
            );
            BlocProvider.of<GetNotesCubit>(context).getNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is EditnoteLoading,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                runSpacing: 20,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 18,
                      ),
                    ),
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: contentController,
                    maxLines: 9,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Content',
                      hintStyle: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 18,
                      ),
                    ),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Card(
                    elevation: 12,
                    color: Colors.black12,
                    child: SizedBox(
                      width: double.infinity,
                      child: ColorPicker(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 25),
                        enableShadesSelection: true,
                        pickersEnabled: const <ColorPickerType, bool>{
                          ColorPickerType.both: false,
                          ColorPickerType.primary: true,
                          ColorPickerType.accent: false,
                          ColorPickerType.bw: false,
                          ColorPickerType.custom: false,
                          ColorPickerType.wheel: false,
                        },
                        // Use the screenPickerColor as start color.
                        color: screenPickerColor,
                        // Update the screenPickerColor using the callback.
                        onColorChanged: (Color color) =>
                            setState(() => screenPickerColor = color),
                        width: 44,
                        height: 44,
                        borderRadius: 22,
                        heading: Text(
                          'Select color',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        subheading: Text(
                          'Select color shade',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
