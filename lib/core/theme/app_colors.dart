import 'package:flutter/material.dart';

const _neutral = <int, Color>{
    100: Color(0xFFF4FAF0),
    200: Color(0xFFE3E8DF),
    300: Color(0xFFD4D9D0),
    400: Color(0xFFBBBFB8),
    500: Color(0xFF959993),
    600: Color(0xFF70736E),
    700: Color(0xFF4B4D49),
    800: Color(0xFF252625),
    900: Color(0xFF0C0D0C),
};

const _primary = <int, Color>{
    100: Color(0xFFFFFF26),
    200: Color(0xFFE7FA11),
    300: Color(0xFFC3F400),
    400: Color(0xFF90D900),
    500: Color(0xFF52C400),
};

const _error = <int, Color>{
    100: Color(0xFFE34040),
    200: Color(0xFFA20C0C),
};

abstract class AppColors {
    static const MaterialColor neutral = MaterialColor(0xFFF4FAF0, _neutral);
    static const MaterialColor primary = MaterialColor(0xFFC3F400, _primary);
    static const MaterialColor error = MaterialColor(0xFFE34040, _error);
}