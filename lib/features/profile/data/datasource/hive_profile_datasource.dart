import 'package:grocify/core/utils/constants.dart';
import 'package:grocify/features/profile/domain/entities/profile_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveProfileDataSource {
  
  Future<Box<ProfileEntity>> get _box async => 
      await Hive.openBox<ProfileEntity>(kHiveProfilesBox);
  
  Future<void> cacheProfile(ProfileEntity profile) async {
    final box = await _box;
    await box.put(profile.id, profile);
  }
  
  Future<ProfileEntity> getCachedProfile(String userId) async {
    final box = await _box;
    final profile = box.get(userId);
    if (profile == null) throw Exception('Profile not cached');
    return profile;
  }
  
  Future<bool> hasCachedProfile(String userId) async {
    final box = await _box;
    return box.containsKey(userId);
  }

  ProfileEntity? getCachedProfileSync(String userId) {
    try {
      final box = Hive.box<ProfileEntity>(kHiveProfilesBox);
      return box.get(userId);
    } catch (e) {
      return null;
    }
  }
}