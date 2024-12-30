import 'package:flutter/material.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:template/configs/app_configs.dart';
import 'package:template/core/functions/validators.dart';
import 'package:template/core/themes/app_colors.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: InternationalPhoneNumberInput(
        locale: 'ar',
        formatInput: false,
        ignoreBlank: false,
        // initialValue: PhoneNumber(
        //   isoCode: country,
        //   // dialCode: '966',
        //   phoneNumber: phone,
        // ),
        textAlign: TextAlign.start,
        // focusNode: phoneFocusNode,
        validator: phoneNumberValidator,
        // textFieldController: phoneController,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(
          color: Colors.black,
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        ),
        inputBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        hintText: 'رقم الهاتف',              
        errorMessage: 'رقم الهاتف غير صالح',
        onInputChanged: (value) {
          // setState(() {
          // });
          // phone = value.phoneNumber ?? '';
          // country = value.isoCode ?? '';
        },
        searchBoxDecoration: const InputDecoration(
          hintText: 'ابحث عن بلدك',
        ),
        // onInputValidated: (value) {
        //   phoneController.text = value.phoneNumber ?? '';
        //   countryController.text = value.isoCode ?? '';
        // },
        selectorConfig: SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          showFlags: true,
          useEmoji: true,
          setSelectorButtonAsPrefixIcon: true,
          leadingPadding: 16,
          countryComparator: (a, b) {
            final isArabicA = AppConfigs.arabicCountries.contains(
              a.alpha2Code,
            );
            final isArabicB = AppConfigs.arabicCountries.contains(
              b.alpha2Code,
            );

            if (isArabicA && !isArabicB) {
              return -1; // a comes first
            } else if (!isArabicA && isArabicB) {
              return 1; // b comes first
            } else {
              // Sort alphabetically by the country name if both are Arabic or 
              // both are non-Arabic
              return a.name!.compareTo(b.name!);
            }
          },
        ),
      ),
    );
  }
}
