class Student {
  final String id;
  final String name;
  final String studyClass;
  final String? phone;
  final String? image;
  final String address;
  final String dateOfBirth;
  final String? notes;

  Student({
    required this.id,
    required this.name,
    required this.studyClass,
    this.phone,
    this.image,
    required this.address,
    required this.dateOfBirth,
    this.notes,
  });
}
