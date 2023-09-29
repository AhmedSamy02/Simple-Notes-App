part of 'editnote_cubit.dart';

@immutable
sealed class EditnoteState {}

final class EditnoteInitial extends EditnoteState {}

final class EditnoteLoading extends EditnoteState {}

final class EditnoteSuccess extends EditnoteState {}

final class EditnoteFailure extends EditnoteState {
  final String message;

  EditnoteFailure({required this.message});
}
