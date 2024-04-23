import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itspark/core/app_routes/app_router.dart';
import 'package:itspark/core/screens/home_screen.dart';
import 'package:itspark/core/widgets/cookbooks/snackbar_message.dart';
import 'package:itspark/core/widgets/custom_app_bar.dart';
import 'package:itspark/modules/students/domain/entities/student.dart';
import 'package:itspark/modules/students/presentation/bloc/add_update_delete_student/add_update_delete_student_bloc.dart';
import 'package:itspark/modules/students/presentation/bloc/students/students_bloc.dart';
import 'package:itspark/modules/students/presentation/widgets/add_update_student_screen/add_update_student_form.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddUpdateStudentScreen extends StatelessWidget {
  final Student? student;
  const AddUpdateStudentScreen({Key? key, this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBar(
              title: student == null ? 'add_student'.tr() : 'update_student'.tr(),
              showBackButton: true,
            ),
            Expanded(
              child: BlocConsumer<AddUpdateDeleteStudentBloc, AddUpdateDeleteStudentState>(
                listener: (context, state) {
                  if (state is SuccessAddStudent) {
                    SnackBarMessage.showSuccessSnackBar(
                        context: context, message: 'student_has_been_added_successfully'.tr());
                    context.read<StudentsBloc>().add(GetAllStudentsEvent());
                    AppRouter.offAll(const HomeScreen());
                  } else if (state is SuccessUpdateStudent) {
                    SnackBarMessage.showSuccessSnackBar(
                        context: context, message: 'student_has_been_updated_successfully'.tr());
                    context.read<StudentsBloc>().add(GetAllStudentsEvent());
                    AppRouter.offAll(const HomeScreen());
                  } else if (state is FailedAddStudent) {
                    SnackBarMessage.showErrorSnackBar(context: context, message: state.message);
                  } else if (state is FailedUpdateStudent) {
                    SnackBarMessage.showErrorSnackBar(context: context, message: state.message);
                  }
                },
                builder: (context, state) {
                  return ModalProgressHUD(
                    inAsyncCall: state is LoadingAddUpdateDeleteStudent,
                    child: AddUpdateStudentForm(student: student),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
