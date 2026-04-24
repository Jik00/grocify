
import 'package:get_it/get_it.dart';
import 'package:grocify/features/auth/presentation/manger/auth_controller/auth_controller.dart';
import 'package:grocify/core/services/supabase_auth_service.dart';
import 'package:grocify/features/auth/data/repos/auth_repo_impl.dart';
import 'package:grocify/features/auth/domain/repos/auth_repo.dart';
import 'package:grocify/features/auth/domain/usecases/check_auth_status.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;
final supabase = Supabase.instance.client;

void setupGetIt() async {
  
  getIt.registerSingleton<SupabaseAuthService>( SupabaseAuthService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl( supabaseAuthService: getIt<SupabaseAuthService>()),
  );

  getIt.registerSingleton<CheckAuthStatusUseCase>(
    CheckAuthStatusUseCase(getIt<AuthRepo>()),
  );

  getIt.registerSingleton<AuthController>(
    AuthController(getIt<CheckAuthStatusUseCase>()),
  );
}
