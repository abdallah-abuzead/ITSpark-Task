import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itspark/core/app_routes/app_router.dart';
import 'package:itspark/core/screens/home_screen.dart';
import 'package:itspark/core/widgets/cookbooks/snackbar_message.dart';
import 'package:itspark/core/widgets/custom_app_bar.dart';
import 'package:itspark/modules/students/presentation/bloc/add_update_delete_student/add_update_delete_student_bloc.dart';
import 'package:itspark/modules/students/presentation/bloc/students/students_bloc.dart';

import '../../../../core/widgets/dialogs/loading_dialog.dart';
import '../widgets/students_screen/students_screen_body.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddUpdateDeleteStudentBloc, AddUpdateDeleteStudentState>(
      listener: (context, state) {
        if (state is LoadingAddUpdateDeleteStudent) {
          showDialog(context: context, builder: (context) => const LoadingDialog());
        } else if (state is SuccessDeleteStudent) {
          SnackBarMessage.showWarningSnackBar(context: context, message: 'student_has_been_deleted_successfully'.tr());
          context.read<StudentsBloc>().add(GetAllStudentsEvent());
          AppRouter.offAll(const HomeScreen());
        } else if (state is FailedDeleteStudent) {
          SnackBarMessage.showErrorSnackBar(context: context, message: state.message);
          AppRouter.back();
        } else {
          AppRouter.back();
        }
      },
      child: Column(children: [
        CustomAppBar(title: 'students'.tr()),
        const Expanded(child: StudentsScreenBody()),
      ]),
    );
  }
}
