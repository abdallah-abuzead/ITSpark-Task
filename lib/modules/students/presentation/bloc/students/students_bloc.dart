import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/messages/failure_messages.dart';
import '../../../domain/entities/student.dart';
import '../../../domain/use_cases/students_use_cases.dart';

part 'students_event.dart';
part 'students_state.dart';

class StudentsBloc extends Bloc<StudentsEvent, StudentsState> {
  final StudentsUseCases useCases;
  List<Student> students = [];

  StudentsBloc({required this.useCases}) : super(StudentsInitial()) {
    on<GetAllStudentsEvent>((event, emit) => _getAllStudentsHandler(event, emit));
  }

  // ====================================================================

  _getAllStudentsHandler(GetAllStudentsEvent event, Emitter<StudentsState> emit) async {
    emit(LoadingStudents());
    final response = await useCases.getAllStudents();
    response.fold(
      (failure) => emit(FailedGetAllStudents(message: FailureMessages.getMessage(failure))),
      (students) {
        this.students = students;
        emit(SuccessGetAllStudents(students: students));
      },
    );
  }
}
