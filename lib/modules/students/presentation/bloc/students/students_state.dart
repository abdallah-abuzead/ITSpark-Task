part of 'students_bloc.dart';

abstract class StudentsState {}

class StudentsInitial extends StudentsState {}

class LoadingStudents extends StudentsState {}

class SuccessGetAllStudents extends StudentsState {
  final List<Student> students;
  SuccessGetAllStudents({required this.students});
}

class FailedGetAllStudents extends StudentsState {
  final String message;
  FailedGetAllStudents({required this.message});
}
