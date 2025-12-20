import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_cubit.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(commonSystemUiOverlayStyle);
    return ScreenUtilInit(
      designSize: Size(390, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => NewContentsCubit())],
        child: MaterialApp.router(
          title: "AI Personal Content Universe",
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            FlutterQuillLocalizations.delegate,
          ],
          theme: ThemeData.dark(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: AppColors.backgroundColor,
            textTheme: TextTheme.of(context).apply(
              fontFamily: APP_FONT_FAMILY,
              displayColor: Colors.white,
              bodyColor: Colors.white,
            ),
            appBarTheme: AppBarTheme.of(context).copyWith(
              backgroundColor: AppColors.backgroundColor,
              elevation: 0,
              surfaceTintColor: AppColors.backgroundColor,
              shadowColor: AppColors.backgroundColor,
            ),
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
