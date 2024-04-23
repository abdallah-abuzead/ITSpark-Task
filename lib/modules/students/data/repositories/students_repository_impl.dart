import 'package:dartz/dartz.dart';
import 'package:itspark/core/errors/exceptions.dart';
import 'package:itspark/core/errors/failures.dart';
import 'package:itspark/modules/students/data/data_sources/students_data_source.dart';
import 'package:itspark/modules/students/data/models/student_model.dart';
import 'package:itspark/modules/students/domain/entities/student.dart';

import '../../domain/repositories/students_repository.dart';

class StudentsRepositoryImpl implements StudentsRepository {
  final StudentsDataSource dataSource;
  StudentsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Student>>> getAllStudents() async {
    try {
      List<Student> students = await dataSource.getAllStudents();
      return right(students);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addStudent({required Student student}) async {
    StudentModel studentModel = StudentModel(
      id: student.id,
      name: student.name,
      studyClass: student.studyClass,
      address: student.address,
      dateOfBirth: student.dateOfBirth,
      image: student.image,
      phone: student.phone,
      notes: student.notes,
    );

    try {
      final response = await dataSource.addStudent(student: studentModel);
      return right(response);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateStudent({required Student student}) async {
    StudentModel studentModel = StudentModel(
      id: student.id,
      name: student.name,
      studyClass: student.studyClass,
      address: student.address,
      dateOfBirth: student.dateOfBirth,
      image: student.image,
      phone: student.phone,
      notes: student.notes,
    );

    try {
      final response = await dataSource.updateStudent(student: studentModel);
      return right(response);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteStudent({required String id}) async {
    try {
      final response = await dataSource.deleteStudent(id: id);
      return right(response);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
