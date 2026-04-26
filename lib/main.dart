import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocify/core/helper_functions/ongenerate_routes.dart';
import 'package:grocify/core/services/custom_bloc_observer.dart';
import 'package:grocify/core/services/get_it_service.dart';
import 'package:grocify/core/services/shared_preferences_singleton.dart';
import 'package:grocify/core/utils/app_colors.dart';
import 'package:grocify/core/utils/constants.dart';
import 'package:grocify/features/profile/domain/entities/profile_entity.dart';
import 'package:grocify/features/splash/presentation/views/splash_view.dart';
import 'package:grocify/generated/l10n.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
  url: kSupabaseUrl,
  anonKey: kSupabaseAnonKey,
  );

  await Hive.initFlutter();
  Hive.registerAdapter(ProfileEntityAdapter());
  
  await Prefs.init();
  setupGetIt();
  Bloc.observer = CustomBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primary),
            textTheme: GoogleFonts.alexandriaTextTheme(),

            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),

          debugShowCheckedModeBanner: false,
          // showPerformanceOverlay: false,
          onGenerateRoute: onGenerateRoutes,
          initialRoute: SplashView.routeName,
          // navigatorKey: navigatorKey,

          // flutter localization
          locale: const Locale('en'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      }
    );
  }
}