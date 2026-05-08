import 'package:get_it/get_it.dart';
import 'package:grocify/core/data_sources/supa_data_source.dart';
import 'package:grocify/features/auth/presentation/manger/auth_controller/auth_controller.dart';
import 'package:grocify/core/services/supabase_auth_service.dart';
import 'package:grocify/features/auth/data/repos/auth_repo_impl.dart';
import 'package:grocify/features/auth/domain/repos/auth_repo.dart';
import 'package:grocify/features/auth/domain/usecases/check_auth_status.dart';
import 'package:grocify/features/cart/data/cart_repo_impl.dart';
import 'package:grocify/features/cart/domain/entities/repos/cart_repo.dart';
import 'package:grocify/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:grocify/features/products_&_fav/data/repo/fav_repo_impl.dart';
import 'package:grocify/features/products_&_fav/domain/repo/fav_repo.dart';
import 'package:grocify/features/products_&_fav/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:grocify/features/profile/data/datasource/hive_profile_datasource.dart';
import 'package:grocify/features/profile/data/repo/profile_repo_impl.dart';
import 'package:grocify/features/profile/domain/repo/profile_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;
final supabase = Supabase.instance.client;

void setupGetIt() async {
  /// data source \\\
  getIt.registerSingleton(SupabaseDataSource(supabase));
  getIt.registerSingleton(HiveProfileDataSource());


  /// services \\\
  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());

  
  /// repos \\\
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(supabaseAuthService: getIt<SupabaseAuthService>()),
  );

  getIt.registerSingleton<FavRepo>(
    FavRepoImpl(
      supabaseDataSource: getIt<SupabaseDataSource>(),
    ),
  );

  getIt.registerSingleton<CartRepo>(
    CartRepoImpl(
      supabaseDataSource: getIt<SupabaseDataSource>(),
    ),
  );

  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(
      supabaseDataSource: getIt<SupabaseDataSource>(),
      localDataSource: getIt<HiveProfileDataSource>(),
    ),
  );

  
  
  /// use cases \\\
  getIt.registerSingleton<CheckAuthStatusUseCase>(
    CheckAuthStatusUseCase(getIt<AuthRepo>()),
  );

  
  /// cubits \\\
  getIt.registerSingleton<AuthController>(
    AuthController(getIt<CheckAuthStatusUseCase>(), getIt<ProfileRepo>()),
  );

  getIt.registerFactoryParam<FavCubit, String, dynamic>(
    (userId, _) => FavCubit(
      userId: userId,
      favRepo: getIt<FavRepo>(),
    ),
  );

  getIt.registerFactoryParam<CartCubit, String, dynamic>(
    (userId, _) => CartCubit(
      userId: userId,
      cartRepo: getIt<CartRepo>(),
    ),
  );

}
