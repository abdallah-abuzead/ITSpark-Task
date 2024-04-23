import 'package:dartz/dartz.dart';
import 'package:itspark/core/errors/exceptions.dart';
import 'package:itspark/modules/students/data/models/student_model.dart';

import '../../../../core/db_helper/db_helper.dart';

abstract class StudentsDataSource {
  Future<List<StudentModel>> getAllStudents();
  Future<Unit> addStudent({required StudentModel student});
  Future<Unit> updateStudent({required StudentModel student});
  Future<Unit> deleteStudent({required String id});
}

class StudentsDataSourceImpl implements StudentsDataSource {
  DBHelper dbHelper = DBHelper();

  @override
  Future<List<StudentModel>> getAllStudents() async {
    try {
      List response = await dbHelper.getAllStudents();
      List<StudentModel> students = response.reversed.map((student) => StudentModel.fromJson(student)).toList();
      return students;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addStudent({required StudentModel student}) async {
    try {
      await dbHelper.addStudent(student.toJson());
      return Future.value(unit);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateStudent({required StudentModel student}) async {
    try {
      await dbHelper.updateStudent(student.toJson());
      return Future.value(unit);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteStudent({required String id}) async {
    try {
      await dbHelper.deleteStudent(id);
      return Future.value(unit);
    } catch (e) {
      throw ServerException();
    }
  }
}
