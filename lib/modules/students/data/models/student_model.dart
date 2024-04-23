import 'dart:io';

import 'package:itspark/modules/students/domain/entities/student.dart';

class StudentModel extends Student {
  StudentModel({
    required super.id,
    required super.name,
    required super.studyClass,
    required super.address,
    required super.dateOfBirth,
    super.phone,
    super.image,
    super.notes,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json['id'],
        name: json['name'],
        studyClass: json['study_class'],
        address: json['address'],
        dateOfBirth: json['date_of_birth'],
        phone: json['phone'],
        image: json['image'] != null
            ? File(json['image']).existsSync()
                ? json['image']
                : null
            : null,
        notes: json['notes'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'study_class': studyClass,
        'address': address,
        'date_of_birth': dateOfBirth,
        'phone': phone,
        'image': image,
        'notes': notes,
      };
}
