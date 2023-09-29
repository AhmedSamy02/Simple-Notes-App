import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubit/edit_note/editnote_cubit.dart';
import 'package:notes_app/cubit/get_notes/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/note_bloc_observer.dart';
import 'package:notes_app/screens/edit_screen.dart';
import 'package:notes_app/screens/home_screen.dart';

void main() async {
  Bloc.observer = NoteBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kHiveBoxName);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetNotesCubit()),
        BlocProvider(create: (context) => EditnoteCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: kHomeScreen,
        routes: {
          kHomeScreen: (context) => const HomeScreen(),
          kEditScreen: (context) => EditScreen()
        },
      ),
    );
  }
}
