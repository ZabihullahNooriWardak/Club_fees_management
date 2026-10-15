enum LanguageEnum {

  english('English'),
  persian('فارسی');

  const LanguageEnum(this.value);

  final String value;

  bool get isEnglish => this==english;
  bool get isPersian => this==persian;
}