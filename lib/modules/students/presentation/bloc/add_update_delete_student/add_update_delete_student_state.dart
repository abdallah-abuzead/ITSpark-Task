part of 'add_update_delete_student_bloc.dart';

abstract class AddUpdateDeleteStudentState {}

class AddUpdateDeleteStudentInitial extends AddUpdateDeleteStudentState {}

class LoadingAddUpdateDeleteStudent extends AddUpdateDeleteStudentState {}

// ====================================================================
class SuccessAddStudent extends AddUpdateDeleteStudentState {}

class FailedAddStudent extends AddUpdateDeleteStudentState {
  final String message;
  FailedAddStudent({required this.message});
}

// ====================================================================
class SuccessUpdateStudent extends AddUpdateDeleteStudentState {}

class FailedUpdateStudent extends AddUpdateDeleteStudentState {
  final String message;
  FailedUpdateStudent({required this.message});
}

// ====================================================================
class SuccessDeleteStudent extends AddUpdateDeleteStudentState {}

class FailedDeleteStudent extends AddUpdateDeleteStudentState {
  final String message;
  FailedDeleteStudent({required this.message});
}
