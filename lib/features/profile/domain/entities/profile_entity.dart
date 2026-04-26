import 'package:hive_flutter/adapters.dart';

part 'profile_entity.g.dart';

@HiveType(typeId: 0)
class ProfileEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String avatarUrl;

  ProfileEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.avatarUrl,
  });

  factory ProfileEntity.fromMap(Map<String, dynamic> data) {
    return ProfileEntity(
      id: data['id'] ?? '',
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      avatarUrl: data['avatar_url'] ?? '',
    );
  }
}
