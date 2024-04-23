import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itspark/modules/students/domain/entities/student.dart';

import '../../../../../core/constants/messages/failure_messages.dart';
import '../../../domain/use_cases/students_use_cases.dart';

part 'add_update_delete_student_event.dart';
part 'add_update_delete_student_state.dart';

class AddUpdateDeleteStudentBloc extends Bloc<AddUpdateDeleteStudentEvent, AddUpdateDeleteStudentState> {
  final StudentsUseCases useCases;

  AddUpdateDeleteStudentBloc({required this.useCases}) : super(AddUpdateDeleteStudentInitial()) {
    on<AddStudentEvent>((event, emit) => _addStudentHandler(event, emit));
    on<UpdateStudentEvent>((event, emit) => _updateStudentHandler(event, emit));
    on<DeleteStudentEvent>((event, emit) => _deleteStudentHandler(event, emit));
  }

  // ====================================================================
  _addStudentHandler(AddStudentEvent event, Emitter<AddUpdateDeleteStudentState> emit) async {
    emit(LoadingAddUpdateDeleteStudent());
    final response = await useCases.addStudent(student: event.student);
    response.fold(
      (failure) => emit(FailedAddStudent(message: FailureMessages.getMessage(failure))),
      (students) => emit(SuccessAddStudent()),
    );
  }

  // ====================================================================
  _updateStudentHandler(UpdateStudentEvent event, Emitter<AddUpdateDeleteStudentState> emit) async {
    emit(LoadingAddUpdateDeleteStudent());
    final response = await useCases.updateStudent(student: event.student);
    response.fold(
      (failure) => emit(FailedUpdateStudent(message: FailureMessages.getMessage(failure))),
      (students) => emit(SuccessUpdateStudent()),
    );
  }

  // ====================================================================
  _deleteStudentHandler(DeleteStudentEvent event, Emitter<AddUpdateDeleteStudentState> emit) async {
    emit(LoadingAddUpdateDeleteStudent());
    final response = await useCases.deleteStudent(id: event.id);
    response.fold(
      (failure) => emit(FailedDeleteStudent(message: FailureMessages.getMessage(failure))),
      (students) => emit(SuccessDeleteStudent()),
    );
  }
}
