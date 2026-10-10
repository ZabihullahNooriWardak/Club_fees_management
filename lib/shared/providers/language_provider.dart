import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Language extends Notifier<Locale>{
  @override
  build() {
    // TODO: implement build

    return Locale('en');
  }

void changeLanguage(){
    if(state==Locale('en')){
      state = Locale('fa');
    }else{
      state = Locale('en');
    }
}
}


final languageProvider = NotifierProvider<Language,Locale>(Language.new);