import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:itspark/core/app_injections/app_injections.dart' as di;
import 'package:itspark/core/screens/splash_screen.dart';

import '../../modules/students/presentation/bloc/add_update_delete_student/add_update_delete_student_bloc.dart';
import '../../modules/students/presentation/bloc/students/students_bloc.dart';
import '../app_routes/app_router.dart';
import '../app_theme/app_theme.dart';
import '../constants/app_strings.dart';
import '../cubits/country_code_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.getIt<StudentsBloc>()..add(GetAllStudentsEvent())),
        BlocProvider(create: (context) => di.getIt<AddUpdateDeleteStudentBloc>()),
        BlocProvider(create: (context) => CountryCodeCubit()..initCountry(context)),
      ],
      child: GetMaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: getAppTheme(context),
        navigatorKey: AppRouter.navigatorKey,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child!),
          );
        },
        home: const SplashScreen(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
