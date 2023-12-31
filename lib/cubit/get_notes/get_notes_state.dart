part of 'get_notes_cubit.dart';

sealed class GetNotesState {}

final class GetNotesInitial extends GetNotesState {}

final class GetNotesLoading extends GetNotesState {}

final class GetNotesSuccess extends GetNotesState {
  final List<NoteModel> list;

  GetNotesSuccess({required this.list});
}

final class GetNotesFailure extends GetNotesState {
  final String errMessage;

  GetNotesFailure({required this.errMessage});
}
