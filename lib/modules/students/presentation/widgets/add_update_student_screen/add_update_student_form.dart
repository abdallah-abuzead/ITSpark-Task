// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itspark/modules/students/presentation/widgets/add_update_student_screen/student_class_drop_down_menu.dart';
import 'package:itspark/modules/students/presentation/widgets/add_update_student_screen/student_picture_field.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/assets/app_images.dart';
import '../../../../../core/cubits/country_code_cubit.dart';
import '../../../../../core/utils/app_functions.dart';
import '../../../../../core/utils/validation/validator.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_input_fields/app_form_fields.dart';
import '../../../../../core/widgets/app_input_fields/app_text_form_field.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../domain/entities/student.dart';
import '../../bloc/add_update_delete_student/add_update_delete_student_bloc.dart';

class AddUpdateStudentForm extends StatefulWidget {
  final Student? student;
  const AddUpdateStudentForm({Key? key, required this.student}) : super(key: key);

  @override
  State<AddUpdateStudentForm> createState() => _AddUpdateStudentFormState();
}

class _AddUpdateStudentFormState extends State<AddUpdateStudentForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  String pickedImagePath = '';

  @override
  void initState() {
    if (widget.student != null) {
      nameController.text = widget.student!.name;
      classController.text = widget.student!.studyClass;
      phoneController.text = widget.student!.phone ?? '';
      addressController.text = widget.student!.address;
      dateOfBirthController.text = widget.student!.dateOfBirth;
      notesController.text = widget.student!.notes ?? '';
      pickedImagePath = widget.student!.image ?? '';
    }
    super.initState();
  }

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) setState(() => pickedImagePath = pickedFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Image.asset(AppImages.logo, height: 150),
          const SizedBox(height: 20),
          // ============================================
          AppText('name'.tr(), fontWeight: FontWeight.w500, color: AppColors.text.shade400),
          const SizedBox(height: 5),
          AppTextFormField(
            controller: nameController,
            hint: 'name_hint'.tr(),
            validator: (_) => Validator.nameValidator(nameController.text),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 16),
          // ============================================
          AppText('class'.tr(), fontWeight: FontWeight.w500, color: AppColors.text.shade400),
          const SizedBox(height: 5),
          StudentClassDropDownMenu(classController: classController),
          const SizedBox(height: 16),
          // ============================================
          AppText('address'.tr(), fontWeight: FontWeight.w500, color: AppColors.text.shade400),
          const SizedBox(height: 5),
          AppTextFormField(
            controller: addressController,
            hint: 'address_hint'.tr(),
            validator: (_) => Validator.addressValidator(addressController.text),
          ),
          const SizedBox(height: 16),
          // ============================================
          AppText('date_of_birth'.tr(), fontWeight: FontWeight.w500, color: AppColors.text.shade400),
          const SizedBox(height: 5),
          AppFormFields.dateOfBirthTextField(context, dateOfBirthController),
          const SizedBox(height: 20),
          // ============================================
          AppText('mobile_number'.tr(), fontWeight: FontWeight.w500, color: AppColors.text.shade400),
          const SizedBox(height: 5),
          AppTextFormField(
            controller: phoneController,
            hint: 'mobile_number_hint'.tr(),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          // ========================================================================================
          AppText('student_picture'.tr(), fontWeight: FontWeight.w500, color: AppColors.text.shade400),
          const SizedBox(height: 5),
          StudentPictureField(
            pickedImagePath: pickedImagePath,
            onPick: (newPath) => setState(() => pickedImagePath = newPath),
          ),
          const SizedBox(height: 20),
          // ===========================================================
          AppText('notes'.tr(), fontWeight: FontWeight.w500, color: AppColors.text.shade400),
          const SizedBox(height: 5),
          AppTextFormField(
            controller: notesController,
            keyboardType: TextInputType.multiline,
            hint: 'notes_hint'.tr(),
            minLines: 3,
            maxLines: 6,
          ),
          const SizedBox(height: 30),
          // ===========================================================
          AppButton(
            title: widget.student == null ? 'add'.tr() : 'save'.tr(),
            padding: const EdgeInsets.symmetric(vertical: 13),
            onPressed: _addUpdateStudent,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Future<void> _addUpdateStudent() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // ========================================================================
      Student student = Student(
        id: widget.student == null ? DateTime.now().millisecondsSinceEpoch.toString() : widget.student!.id,
        name: nameController.text,
        studyClass: classController.text,
        address: addressController.text,
        dateOfBirth: dateOfBirthController.text,
        image: await AppFunctions.saveImageExternally(pickedImagePath),
        phone: phoneController.text.isEmpty
            ? null
            : CountryCodeCubit.of(context).getCountryConcatenatedCode() + phoneController.text,
        notes: notesController.text.isEmpty ? null : notesController.text,
      );
      // ========================================================================
      if (widget.student != null) await AppFunctions.deleteFile(widget.student!.image);
      context.read<AddUpdateDeleteStudentBloc>().add(
            widget.student == null ? AddStudentEvent(student: student) : UpdateStudentEvent(student: student),
          );
    }
  }
}
