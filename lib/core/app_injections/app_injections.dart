import 'package:get_it/get_it.dart';
import 'package:itspark/modules/students/data/data_sources/students_data_source.dart';
import 'package:itspark/modules/students/domain/repositories/students_repository.dart';
import 'package:itspark/modules/students/domain/use_cases/students_use_cases.dart';
import 'package:itspark/modules/students/presentation/bloc/students/students_bloc.dart';

import '../../modules/students/data/repositories/students_repository_impl.dart';
import '../../modules/students/presentation/bloc/add_update_delete_student/add_update_delete_student_bloc.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  /// Blocs & Cubits
  getIt.registerFactory(() => StudentsBloc(useCases: getIt()));
  getIt.registerFactory(() => AddUpdateDeleteStudentBloc(useCases: getIt()));

  /// UseCases
  getIt.registerLazySingleton(() => StudentsUseCases(repository: getIt()));

  /// Repository
  getIt.registerLazySingleton<StudentsRepository>(() => StudentsRepositoryImpl(dataSource: getIt()));

  /// DataSources
  getIt.registerLazySingleton<StudentsDataSource>(() => StudentsDataSourceImpl());
}
