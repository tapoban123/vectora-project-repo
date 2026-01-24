import 'package:ai_personal_content_app/core/configs/objectbox_config.dart';
import 'package:ai_personal_content_app/core/theme/app_colors.dart';
import 'package:ai_personal_content_app/core/theme/app_fonts.dart';
import 'package:ai_personal_content_app/core/utils/utils.dart';
import 'package:ai_personal_content_app/features/home/controllers/cubits/recent_items_cubit.dart';
import 'package:ai_personal_content_app/features/home/controllers/new_contents_bloc/new_contents_bloc.dart';
import 'package:ai_personal_content_app/features/items/controllers/cubits/pinned_items_cubit.dart';
import 'package:ai_personal_content_app/features/search/controllers/contents_manager_bloc/contents_manager_bloc.dart';
import 'package:ai_personal_content_app/features/search/controllers/filter_and_sort_preferences_cubit.dart';
import 'package:ai_personal_content_app/features/search/controllers/search_contents_bloc/search_contents_bloc.dart';
import 'package:ai_personal_content_app/firebase_options.dart';
import 'package:ai_personal_content_app/get_it.dart';
import 'package:ai_personal_content_app/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

late final ObjectboxConfig objectBoxInstance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  objectBoxInstance = await ObjectboxConfig.create();

  init();
  await getIt.allReady();
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
        providers: [
          BlocProvider(create: (context) => getIt<NewContentsBloc>()),
          BlocProvider(create: (context) => getIt<ContentsManagerBloc>()),
          BlocProvider(create: (context) => getIt<SearchContentsBloc>()),
          BlocProvider(create: (context) => getIt<RecentItemsCubit>()),
          BlocProvider(create: (context) => getIt<PinItemsCubit>()),
          BlocProvider(
            create: (context) => getIt<FilterAndSortPreferencesCubit>(),
          ),
        ],
        child: MaterialApp.router(
          title: "Vectora",
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
            iconButtonTheme: IconButtonThemeData(
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ),
          routerConfig: router,
        ),
      ),
    );
  }
}
