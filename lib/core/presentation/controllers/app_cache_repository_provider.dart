import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/core/data/repositories/app_cache_repository.dart';

final sharedPreferenceProvider = Provider<SharedPreferencesAsync>((ref) {
  return SharedPreferencesAsync();
});

final appCacheRepositoryProvider = Provider<AppCacheRepository>((ref) {
  final sharedPreference = ref.watch(sharedPreferenceProvider);

  return AppCacheRepository(sharedPreference);
});
