import 'package:dartz/dartz.dart';
import 'package:itspark/modules/students/domain/repositories/students_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/student.dart';

class StudentsUseCases {
  final StudentsRepository repository;

  StudentsUseCases({required this.repository});

  Future<Either<Failure, List<Student>>> getAllStudents() => repository.getAllStudents();
  Future<Either<Failure, Unit>> addStudent({required Student student}) => repository.addStudent(student: student);
  Future<Either<Failure, Unit>> updateStudent({required Student student}) => repository.updateStudent(student: student);
  Future<Either<Failure, Unit>> deleteStudent({required String id}) => repository.deleteStudent(id: id);
}
