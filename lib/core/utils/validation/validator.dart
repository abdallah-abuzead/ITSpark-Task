import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String? nameValidator(String? name) {
    if (name!.trim().isEmpty) return 'Name is Required.';
    if (name.length < 2) return 'Name must be at least 2 characters.';
    if (name.length > 50) return 'Name must be at most 50 character.';
    return null;
  }

  static String? phoneValidator(String? mobileNo) {
    if (mobileNo!.trim().isEmpty) return 'Phone number is Required.';
    if (mobileNo.trim().length < 8 || mobileNo.trim().length > 15) return 'Invalid phone number.';
    return null;
  }

  static String? studyClassValidator(String? studyClass) {
    if (studyClass!.trim().isEmpty) return 'student_class_is_required'.tr();
    return null;
  }

  static String? addressValidator(String? address) {
    if (address!.trim().isEmpty) return 'Address is Required.';
    return null;
  }

  static String? dateOfBirthValidator(String? dateOfBirth) {
    if (dateOfBirth!.trim().isEmpty) return 'date_of_birth_is_required'.tr();
    return null;
  }
}
