import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itspark/modules/students/presentation/widgets/students_screen/student_card.dart';

import '../../../../../core/app_routes/app_router.dart';
import '../../../../../core/constants/app_locale.dart';
import '../../../../../core/constants/assets/app_icons.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_input_fields/app_text_form_field.dart';
import '../../../../../core/widgets/cookbooks/errors/empty_widget.dart';
import '../../../../../core/widgets/cookbooks/errors/server_error_widget.dart';
import '../../../../../core/widgets/cookbooks/loading_widget.dart';
import '../../../domain/entities/student.dart';
import '../../bloc/students/students_bloc.dart';
import '../../screens/add_update_student_screen.dart';
import 'no_matched_results_widget.dart';

class StudentsScreenBody extends StatefulWidget {
  const StudentsScreenBody({Key? key}) : super(key: key);

  @override
  State<StudentsScreenBody> createState() => _StudentsScreenBodyState();
}

class _StudentsScreenBodyState extends State<StudentsScreenBody> {
  final TextEditingController searchController = TextEditingController();
  List<Student> filteredStudents = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentsBloc, StudentsState>(builder: (context, state) {
      if (state is SuccessGetAllStudents) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (filteredStudents.isEmpty && state.students.isNotEmpty && searchController.text.isEmpty) {
            setState(() => filteredStudents = state.students);
          }
        });

        return state.students.isEmpty
            ? EmptyWidget(
                name: 'students_empty'.tr(),
                onPressed: () => AppRouter.to(const AddUpdateStudentScreen()),
              )
            : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // =================================================================
                    AppTextFormField(
                      controller: searchController,
                      hint: tr('search'),
                      keyboardType: TextInputType.text,
                      action: TextInputAction.done,
                      prefixIcon: SizedBox(width: 30, child: Center(child: SvgPicture.asset(AppIcons.search))),
                      onChanged: (val) => _filter(state.students),
                    ),
                    const SizedBox(height: 16),
                    // =================================================================
                    Expanded(
                      child: searchController.text.isNotEmpty && filteredStudents.isEmpty
                          ? const NoMatchedResultsWidget()
                          : ListView.separated(
                              separatorBuilder: (context, i) => const SizedBox(height: 12),
                              itemCount: filteredStudents.length,
                              itemBuilder: (context, i) => StudentCard(student: filteredStudents[i]),
                            ),
                    ),
                    const SizedBox(height: 20),
                    // =================================================================
                    AppButton(
                      title: 'add_student'.tr(),
                      onPressed: () => AppRouter.to(const AddUpdateStudentScreen()),
                      icon: const Icon(Icons.add, size: 18),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: AppLocale.isEnglish ? 12 : 8),
                    ),
                    // =================================================================
                  ],
                ),
              );
      } else if (state is FailedGetAllStudents) {
        return ServerErrorWidget(onPressed: () => BlocProvider.of<StudentsBloc>(context).add(GetAllStudentsEvent()));
      } else {
        return const LoadingWidget();
      }
    });
  }

  void _filter(List<Student> students) {
    if (searchController.text.isEmpty) {
      setState(() => filteredStudents = students);
    } else {
      setState(() {
        filteredStudents = students
            .where((student) =>
                student.name.toLowerCase().contains(searchController.text.toLowerCase()) ||
                student.id.toLowerCase().contains(searchController.text.toLowerCase()) ||
                student.dateOfBirth.toLowerCase().contains(searchController.text.toLowerCase()))
            .toList();
      });
    }
  }
}
