part of 'add_update_delete_student_bloc.dart';

abstract class AddUpdateDeleteStudentEvent {}

class AddStudentEvent extends AddUpdateDeleteStudentEvent {
  final Student student;
  AddStudentEvent({required this.student});
}

class UpdateStudentEvent extends AddUpdateDeleteStudentEvent {
  final Student student;
  UpdateStudentEvent({required this.student});
}

class DeleteStudentEvent extends AddUpdateDeleteStudentEvent {
  final String id;
  DeleteStudentEvent({required this.id});
}
