import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_training/core/theme/app_colors.dart';

TextStyle display = GoogleFonts.inter(
  fontSize: 16,
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.italic,
  color: AppColors.primary
);

TextStyle headline = GoogleFonts.inter(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: AppColors.neutral[400]
);

TextStyle tituloLarge = GoogleFonts.inter(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: AppColors.neutral[200]
);

TextStyle tituloMedio = GoogleFonts.inter(
  fontSize: 20,
  fontWeight: FontWeight.normal,
  color: AppColors.primary[100]
);

TextStyle body = GoogleFonts.inter(
  fontSize: 12,
  fontWeight: FontWeight.normal,
  color: AppColors.neutral
);

TextStyle label = GoogleFonts.inter(
  fontSize: 12,
  fontWeight: FontWeight.bold,
  color: AppColors.neutral[400]
);