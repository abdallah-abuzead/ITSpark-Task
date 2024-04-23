import 'package:country_calling_code_picker/country.dart';
import 'package:country_calling_code_picker/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_routes/app_router.dart';

class CountryCodeCubit extends Cubit<Country?> {
  CountryCodeCubit() : super(null);

  static CountryCodeCubit of(context) => BlocProvider.of(context);

  void initCountry(BuildContext? context) async {
    final Country defaultCountry = await getDefaultCountry(context!);
    final Country? egypt = await getCountryByCountryCode(AppRouter.currentContext!, 'EG');
    if (defaultCountry.countryCode == 'EG') {
      emit(defaultCountry);
    } else {
      emit(egypt);
    }
  }

  void setState(Country country) => emit(country);

  String getCountryConcatenatedCode() {
    // return state!.callingCode == '+20' ? '+2' : state!.callingCode;
    return state!.callingCode;
  }
}
