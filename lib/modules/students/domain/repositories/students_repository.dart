import 'package:dartz/dartz.dart';
import 'package:itspark/core/errors/failures.dart';

import '../entities/student.dart';

abstract class StudentsRepository {
  Future<Either<Failure, List<Student>>> getAllStudents();
  Future<Either<Failure, Unit>> addStudent({required Student student});
  Future<Either<Failure, Unit>> updateStudent({required Student student});
  Future<Either<Failure, Unit>> deleteStudent({required String id});
}
