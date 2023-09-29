import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'editnote_state.dart';

class EditnoteCubit extends Cubit<EditnoteState> {
  EditnoteCubit() : super(EditnoteInitial());

  editNote(
    dynamic key,
    NoteModel note,
  ) async {
    emit(EditnoteLoading());
    try {
      await Hive.box<NoteModel>(kHiveBoxName).put(key, note);
      emit(EditnoteSuccess());
    } catch (e) {
      emit(EditnoteFailure(message: 'Failed : ${e.toString()}'));
    }
  }
}
