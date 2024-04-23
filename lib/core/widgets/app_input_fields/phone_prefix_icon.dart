import 'package:country_calling_code_picker/country.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../app_routes/app_router.dart';
import '../../constants/app_colors.dart';
import '../../cubits/country_code_cubit.dart';
import 'my_country_code_picker.dart' as mycc;

class PhonePrefixIcon extends StatelessWidget {
  const PhonePrefixIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CountryCodeCubit.of(context);
    return Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.only(left: 12),
        width: 104,
        decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.borderShade75))),
        child: GestureDetector(
          onTap: () async {
            final Country? selectedCountry = await _showCountryPickerSheet(context);
            if (selectedCountry != null) cubit.setState(selectedCountry);
          },
          child: BlocBuilder<CountryCodeCubit, Country?>(
            builder: (context, state) {
              return state == null
                  ? const Icon(Icons.phone_android)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Image.asset(
                            state.flag,
                            package: mycc.countryCodePackageName,
                            width: 24,
                            height: 16,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          state.callingCode,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const Icon(Icons.arrow_drop_down_rounded, size: 25)
                      ],
                    );
            },
          ),
        ));
  }

  Future<Country?> _showCountryPickerSheet(BuildContext context) {
    return showModalBottomSheet<Country?>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (_) {
        return SizedBox(
          height: Get.height * 0.8,
          child: Column(
            children: [
              const SizedBox(height: 16),
              Stack(
                children: [
                  Positioned(
                    right: 8,
                    top: 4,
                    bottom: 0,
                    child: IconButton(onPressed: () => AppRouter.back(), icon: const Icon(Icons.close, size: 22)),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child:
                          Text(tr('choose_region'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: mycc.MyCountryPickerWidget(
                  onSelected: (country) => Navigator.of(context).pop(country),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
