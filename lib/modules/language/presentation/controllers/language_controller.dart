import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/core/domain/models/enums/app_cache_enum.dart';
import 'package:untitled1/core/presentation/controllers/app_cache_repository_provider.dart';

class Language extends AsyncNotifier<Locale> {
  @override
  build() async {
    // TODO: implement build

    final appCacheRepository = ref.read(appCacheRepositoryProvider);

    final selectedLang =
        await appCacheRepository.getString(AppCacheEnum.language.value) ?? 'en';

    return Locale(selectedLang);
  }

  Future<void> changeLanguage() async {
    if (state.value == Locale('en')) {
      state = AsyncData(Locale('fa'));
    } else {
      state = AsyncData(Locale('en'));
    }

    final appCacheRepository = ref.read(appCacheRepositoryProvider);

    await appCacheRepository.saveString(
      AppCacheEnum.language.value,
      state.value?.languageCode ?? 'en',
    );
  }
}

final languageProvider = AsyncNotifierProvider<Language, Locale>(Language.new);
