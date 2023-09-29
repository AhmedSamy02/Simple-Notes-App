import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';

import 'package:notes_app/models/note_model.dart';

part 'get_notes_state.dart';

class GetNotesCubit extends Cubit<GetNotesState> {
  GetNotesCubit() : super(GetNotesInitial());
  getNotes() {
    emit(GetNotesLoading());
    try {
      var box = Hive.box<NoteModel>(kHiveBoxName);
      var lis = box.values.toList();
      lis.sort(
        (b, a) {
          var x = DateFormat.yMd().parse(a.date);
          var y = DateFormat.yMd().parse(b.date);
          return x.compareTo(y);
        },
      );
      lis = lis.reversed.toList();
      emit(GetNotesSuccess(list: lis));
    } catch (e) {
      emit(GetNotesFailure(errMessage: 'Failed : ${e.toString()}'));
    }
  }
}
